# Faster Docker builds with Poetry using Python

**Contents**:

- [Faster Docker builds with Poetry using Python](#faster-docker-builds-with-poetry-using-python)
  - [The Project](#the-project)

## The Project

This project serves as a scaffold for projects that aim to deploy 
Python applications using optimal Docker builds with Poetry $^1$ 
on Google Cloud's Cloud Run serverless service.

This scaffold consists of a simple Flask API web server that 
receives GET and POST requests.

The project dependencies and versions is managed using 
[Poetry](https://python-poetry.org/) 

The application is containerised using different Docker builds:

* `naive.Dockerfile`: A "naive" Dockerfile that just copies the 
code and installs it using `poetry install`

* `sm.Dockerfile`: A Dockerfile used by a company named "sm" that
extracts the `requirements.txt` file for the project dependencies
to run the container.

* `optimal.Dockerfile`: An optimised Dockerfile following the 
recommendations by @albertazzir (see $^1$)

The structure of the project is as follows:

```
scaffold-flaskapi-docker-gcp
├─ app
|  └─ flask-api.py
├─ naive.Dockerfile
├─ optimal.Dockerfile
├─ poetry.lock
├─ pyproject.toml
├─ README.md
└─ sm.Dockerfile
```

$^1$ Source: https://medium.com/@albertazzir/blazing-fast-python-docker-builds-with-poetry-a78a66f5aed0
