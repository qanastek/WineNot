FROM bitnami/python:latest

LABEL Author="LABRAK Yanis & BAH Houssainatou"

COPY * /

RUN install_packages libgl1-mesa-glx

RUN pip install -r /requirements.txt

# ENV PYTHONDONTWRITEBYTECODE 1
ENV FLASK_APP "/server.py"
ENV FLASK_ENV "development"
# ENV FLASK_DEBUG True

EXPOSE 5000

CMD flask run --host=0.0.0.0