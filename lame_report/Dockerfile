# syntax=docker/dockerfile:1.4

# Choose a python version that you know works with your application
FROM python:3.9-slim

WORKDIR /app

COPY --link requirements.txt .
# Install the requirements
RUN pip install -r requirements.txt

# You may copy more files like csv, images, data
COPY --link report.py .
# COPY . .

EXPOSE 8080

# Create a non-root user and switch to it
RUN useradd -m app_user
USER app_user

CMD [ "marimo", "run", "report.py", "-p", "8080" ]
