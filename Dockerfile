# Dockerfile
FROM ubuntu:24.04

# Install necessary packages (if any)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    libssl3 \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the rindexer binary into the container
COPY rindexer_cli ./rindexer_cli 
COPY abis ./abis
COPY rindexer.yaml ./rindexer.yaml
COPY start.sh ./start.sh

# Make the binary executable
RUN chmod 777 ./rindexer_cli
RUN chmod 777 /app/start.sh


# Command to run the rindexer_cli with environment variables
ENTRYPOINT ["/app/start.sh"]
