FROM python:3.9-alpine3.13
LABEL maintaner="beckhong"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app
EXPOSE 9000

RUN apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev
RUN python -m venv /django_env && \
    /django_env/bin/pip install --upgrade pip && \
    /django_env/bin/pip install -r /requirements.txt && \
    apk del .tmp-deps && \
    adduser --disabled-password --no-create-home app

ENV PATH="/django_env/bin:$PATH"
USER app