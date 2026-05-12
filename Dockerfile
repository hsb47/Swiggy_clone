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

FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve

EXPOSE 8080

CMD serve -s build -l 8080
