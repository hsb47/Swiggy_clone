# # Use lightweight Node image
# FROM node:18-alpine

# # Set working directory
# WORKDIR /app

# # Copy dependencies
# COPY package*.json ./
# RUN npm install

# # Copy app code
# COPY . .

# # Build React app (creates /build folder)
# RUN npm run build

# # Install lightweight static server
# RUN npm install -g serve

# # Expose port
# EXPOSE 8080

# # Serve production build
# CMD ["sh", "-c", "serve -s build -l tcp://0.0.0.0:$PORT"]

FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

RUN printf 'server {\n\
    listen 8080;\n\
    server_name localhost;\n\
    location / {\n\
        root /usr/share/nginx/html;\n\
        index index.html;\n\
        try_files $uri /index.html;\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
