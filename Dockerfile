# Use the official Node.js image as a base
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy only package.json and yarn.lock first to leverage Docker's cache
COPY package.json yarn.lock ./

# Install dependencies (this layer will be cached if yarn.lock doesn't change)
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the Next.js app (defined in the Dockerfile, this will be run during the pipeline)
RUN yarn build

# Expose port 3000 and specify the command to run the app
EXPOSE 3000
CMD ["yarn", "start"]