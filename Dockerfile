# Use the official Node.js image as the base
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/SecDev0ps/LayerEdge-Docker.git

# Change to the repository directory
WORKDIR /app/LedgeBot

# Install the required dependencies
RUN npm install

# Copy the proxy configuration file into the container
COPY proxy.txt .

# Copy wallets.json into the container (if it exists)
COPY wallets.json .

# Run the auto referral script
RUN npm run autoref

# Run the main script
CMD ["npm", "run", "start"]
