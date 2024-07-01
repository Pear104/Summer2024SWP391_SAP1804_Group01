# Use the official Node.js image as a parent image
FROM node:20-alpine AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# FROM nginx:alpine
# COPY --from=builder /app/dist /usr/share/nginx/html
# Expose the port the app runs on
EXPOSE 3000

# Start Nginx server
# CMD ["nginx", "-g", "daemon off;"]
CMD [ "npm", "run","dev" ]
