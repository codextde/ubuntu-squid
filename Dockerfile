# Use the latest Ubuntu base image
FROM ubuntu:latest

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Squid
RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean

# Create a custom Squid configuration file directly within the Dockerfile
RUN echo "\
# Define the HTTP port\n\
http_port 3128\n\
\n\
# Allow all access\n\
http_access allow all\n\
" > /etc/squid/squid.conf

# Expose Squid HTTP port
EXPOSE 3128

# Start Squid in the foreground
CMD ["squid", "-N", "-d", "1"]
