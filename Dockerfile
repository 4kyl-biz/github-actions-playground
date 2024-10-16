# Use the official Node.js image as a base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only the package.json and yarn.lock from the correct folder
COPY my-app/package.json my-app/yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code
COPY my-app/ .

# Build the Next.js app
RUN yarn build

# Expose port 3000 and specify the command to run the app
EXPOSE 3000
CMD ["yarn", "start"]