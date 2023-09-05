# build environment
#FROM node:9.6.1 as builder
#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app
#ENV PATH /usr/src/app/node_modules/.bin:$PATH
#COPY package.json /usr/src/app/package.json
#RUN npm install --silent
#RUN npm install react-scripts@1.1.1 -g --silent
#COPY . /usr/src/app
#RUN npm run build


# production environment
#FROM nginx:1.13.9-alpine
#COPY --from=builder /usr/src/app/build /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]


# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Expose a port (if your app requires one, e.g., for a development server)
 EXPOSE 80

# Define the command to start your application (e.g., for production)
#!/bin/bash

# Run any setup or pre-start commands here
# For example, you might want to run database migrations before starting your app

# Start your application
CMD ["./entrypoint.sh"]




