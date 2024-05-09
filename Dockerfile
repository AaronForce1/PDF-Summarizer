# Use the official Python base image
FROM python:3.11-slim

# Set the working directory in the container
ENV HOME /app
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .
COPY setup.py .

# Update Existing Base Packages
RUN apt-get update && apt-get upgrade --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install debugging tools (can be removed in the future)
RUN apt-get update && apt-get install --no-install-recommends -y \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Copy the rest of the project files to the container
COPY . .

RUN chown -R nobody:nogroup /app && \
    chmod -R 777 /app && \
    chmod -R 777 /usr/local/lib/python*

USER nobody
