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

# understand how to use the Dockerfile
# and how to build and run the Docker container.
# To build the Docker image, run the following command in the terminal:
# docker build -t ml_analysis .
# To run the Docker container, use the following command:
# docker run -p 5000:5000 ml_analysis
# This will map port 5000 on your host machine to port 5000 in the container.
# You can then access the application by navigating to http://localhost:5000 in your web browser.
# Make sure to replace "app.py" with the name of your main application file.
# If you have any additional files or directories that need to be included in the Docker image,
# make sure to copy them into the container as well.
# You can do this by adding additional COPY instructions in the Dockerfile.
# For example, if you have a directory called "data" that contains input data files,
# you can copy it into the container with the following command:
# COPY data/ /app/data/

# This will copy the "data" directory from your host machine into the "/app/data/" directory in the container.
# You can then access the data files in your application code using the path "/app/data/filename".
# Make sure to adjust the paths and filenames as needed for your specific application.
# If you have any environment variables that need to be set for your application,
# you can do this using the ENV instruction in the Dockerfile.