# Specify the base image
FROM node:18.16.0

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the app source code to the working directory
COPY . .

# Expose a port (if your app listens on a specific port)
EXPOSE 3000

# Copy the create_tables.sql file to a directory in the container
COPY init.sql /docker-entrypoint-initdb.d/

# Specify the command to run your app
CMD [ "node", "app" ]
