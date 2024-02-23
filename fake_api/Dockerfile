# syntax=docker/dockerfile:1.4

# Choose a python version that you know works with your application
FROM python:3.9-slim

WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the requirements
RUN pip install -r requirements.txt

# Copy your application file
COPY app.py .

# Expose the port the app runs on
EXPOSE 8080

# Create a non-root user and switch to it
RUN useradd -m app_user
USER app_user

# Start the Flask application
CMD [ "python", "app.py"]