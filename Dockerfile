FROM python:3.8.20-slim-bullseye


SHELL ["/bin/bash", "-c"]

#set environment variables
ENV PYTONDONTWRITEBYTECODE 1
ENV PYTONUNBUFFERED 1

RUN pip3 install --upgrade pip

#RUN useradd -rms /bin/bash djapp && chmod 777 /opt /run

WORKDIR /djapp

#RUN mkdir /djapp/static && mkdir /djapp/media && chown -R djapp:djapp /djapp & chmod 777 /djapp

EXPOSE 8000

COPY . .

RUN pip3 install -r requirements.txt

#USER djapp

CMD ["manage.py", "runserver", "0.0.0.0:8000"]