# The first instruction is what image we want to base our container on 
# We use official python runtime as a parent image .

FROM python:3.10-slim-buster

# Open http port 
EXPOSE 8000

# The environment variable ensures that python output is set straight 
# to the terminal without burruring it first 
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV DEBIAN_FRONTEND noninteractive


# Install pip and gunicorn web server
RUN pip install --no-cache-dir --upgrade pip
RUN pip install gunicorn==20.1.0

# Install requirements.txt
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

# Moving application files
WORKDIR /app
COPY . /app