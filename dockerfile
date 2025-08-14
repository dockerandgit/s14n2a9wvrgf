# Use the Python 3.10 image as base
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Upgrade Pip and Setuptools
RUN pip install --upgrade pip setuptools

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Specify the command to run the script with the provided files
CMD ["python", "kemono-dl.py", "--cookies", "/app/cookies.txt", "--from-file", "/app/links.txt", "--restrict-names", "--filename-pattern", "[{published}]_{title}_{index}_{filename}.{ext}"]
