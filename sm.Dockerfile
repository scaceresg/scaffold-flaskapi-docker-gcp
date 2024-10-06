FROM python:3.10.15-slim

ENV APP_HOME=/app
WORKDIR $APP_HOME

COPY app .
COPY requirements.txt .
COPY pyproject.toml .

RUN apt-get -y update
RUN pip install -U pip
RUN pip install -r requirements.txt

CMD [ "python", "-m", "flask-api", "--host=0.0.0.0" ]