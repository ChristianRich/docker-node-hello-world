FROM node:6.9.4

# Install dependencies including build-essential, libpq-dev, and libkrb5-dev
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libkrb5-dev tzdata && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Configure timezone and create symlink for Sydney timezone
RUN cp /usr/share/zoneinfo/Australia/Sydney /etc/localtime && \
    echo "Australia/Sydney" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

# Copy package.json and install dependencies
COPY package.json /usr/src/app/
RUN npm install

# Copy the rest of the application code
COPY . /usr/src/app

# Set an environment variable to indicate Dockerized version
ENV RUNNING_DOCKER true

# Expose port 3000 for the application
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
