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
# EXPOSE 3000

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

RUN sed -i 's/listen       80;/listen       3000;/g' /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
