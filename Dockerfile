# the official Python image from the Docker Hub
FROM python:3.12-slim

# Set environment variables to reduce Python output and buffer
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt first for efficient caching
COPY requirements.txt /app/

# Install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the project files to the container
COPY . /app/

# Add the command to create the static files directory
RUN mkdir -p /app/staticfiles

# Expose port 8080
EXPOSE 8080

# Run Django collectstatic and migrations
RUN python manage.py collectstatic --noinput && python manage.py migrate

# Set the entrypoint command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]

