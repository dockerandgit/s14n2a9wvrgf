# Use the Python 3.9 image as base
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the source code into the container
COPY src/ .

# Install dependencies
RUN pip install -r requirements.txt

# Specify the command to run the script with the provided files
CMD ["python", "kemono-dl.py", "--cookies", "/app/cookies.txt", "--from-file", "/app/links.txt"]
