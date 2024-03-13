# Use the official Python image from Docker Hub with the desired version
FROM python:3.12.1

# Set the working directory inside the container
ENV MAIN /main
WORKDIR $APP_HOME

# Copy the entire local directory into the container
COPY . .

# Install pipenv
RUN pip install pipenv

# Install dependencies from Pipfile.lock
RUN pipenv install --deploy --system

# Expose the port where the application runs inside the container
EXPOSE 5000

# Define the command to run the CLI
CMD ["python", "main.py"]
