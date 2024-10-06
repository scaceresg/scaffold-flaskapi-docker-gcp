FROM python:3.10.15-slim
# 302MB
RUN pip install poetry

COPY . .

RUN poetry install

EXPOSE 5000

CMD [ "poetry", "run", "python", "-m", "app.flask-api", "--host=0.0.0.0" ]