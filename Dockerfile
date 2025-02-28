# Stage 1: Backend
FROM --platform=linux/amd64 python:3.8.10-slim AS backend

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create working directory
RUN mkdir -p /GreaterWMS/templates
WORKDIR /GreaterWMS

# Copy requirements and scripts
COPY ./requirements.txt /GreaterWMS/requirements.txt
COPY ./backend_start.sh /GreaterWMS/backend_start.sh

# Install system dependencies
RUN apt-get update --fix-missing && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends build-essential supervisor && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN python3 -m pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install supervisor daphne 'Twisted[tls,http2]'

# Make the start script executable
RUN chmod +x /GreaterWMS/backend_start.sh

# Expose the port
EXPOSE 8008

# Run the application
CMD ["/GreaterWMS/backend_start.sh"]
