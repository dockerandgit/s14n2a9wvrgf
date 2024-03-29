# Use the official Python image as base
FROM python:3

# Set environment variables to disable path length limit during installation
ENV PYTHONIOENCODING=utf-8
ENV PATH_LENGTH=unlimited

# Set the working directory inside the container
WORKDIR /app

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip

# Download source code for the latest release and extract it
RUN wget -O latest.zip https://github.com/your-github-username/your-repository/archive/latest.zip && \
    unzip latest.zip && \
    rm latest.zip && \
    mv your-repository-latest/* . && \
    rm -r your-repository-latest

# Install dependencies from requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Define the entrypoint command
CMD ["python", "kemono-dl.py"]
