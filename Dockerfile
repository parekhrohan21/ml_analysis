# Setting the instructions for the Dockerfile
# Use the official Python image from Docker Hub
FROM python:3.11-slim
# Set the working directory in the container
WORKDIR /app
# Copy the requirements file into the container
COPY requirements.txt .
# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt
# Copy the rest of the application code into the container
COPY . .
# Expose the port that the application will run on
EXPOSE 5000
# Set the environment variable to prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE 1
# Set the environment variable to buffer output
ENV PYTHONUNBUFFERED 1
# Command to run the application
CMD ["python", "app.py"]
# Note: The application should be designed to run on port 5000
# and should be able to handle incoming requests.
# The application should be able to read the input data from a specified location
