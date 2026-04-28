# Use lightweight Node image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependencies
COPY package*.json ./
RUN npm install

# Copy app code
COPY . .

# Build React app (creates /build folder)
RUN npm run build

# Install lightweight static server
RUN npm install -g serve

# Expose port
EXPOSE 3000

# Serve production build
CMD ["serve", "-s", "build", "-l", "3000"]