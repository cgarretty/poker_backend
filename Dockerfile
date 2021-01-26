FROM python:3.7-slim-buster

# Internally, we arbitrarily use port 3000
ENV PORT 8888

# Which version of Python?
ENV PYTHONUNBUFFERED 1

ARG PROJECT=poker_backend
ARG PROJECT_DIR=/code

# Set up container directory
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR

# Actually install dependencies
COPY ./Pipfile .
COPY ./Pipfile.lock .
RUN pip install pipenv
RUN pipenv install --system --ignore-pipfile --deploy
RUN groupadd -r pokeruser && useradd --no-log-init -r -g pokeruser pokeruser
