FROM python:3.10.15-slim as builder

RUN pip install poetry

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN touch README.md
RUN --mount=type=cache,target=$POETRY_CACHE_DIR poetry install --only main --no-root

FROM python:3.10.15-slim as runtime

ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH"

COPY --from=builder $VIRTUAL_ENV $VIRTUAL_ENV

COPY app ./app

CMD [ "python", "-m", "app.flask-api", "--host=0.0.0.0" ]