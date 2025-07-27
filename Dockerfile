# Use official Node.js base image (LTS version)
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json separately for better caching
COPY src/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code
COPY src/ .

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]

