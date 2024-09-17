# Use Ubuntu 24.10 as base image
FROM ubuntu:24.10

# Set environment variables to avoid user prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary dependencies
RUN apt-get update && \
    apt-get install -y pipx
    
# Set Poetry environment variables
ENV PATH="/root/.local/bin:$PATH"

# # Install Poetry
RUN pipx install poetry

# Set the working directory
WORKDIR /app

# Copy the project source code into the Docker container
COPY . /app

# Install project dependencies and server using Poetry
RUN poetry install

# Run the server using Poetry
CMD ["poetry", "run", "skybrushd"]
