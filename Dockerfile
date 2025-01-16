FROM python:3.10
# FROM python:3.10-alpine           # its lighweight version works on basic django application 

ENV PYTHONDONOTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
# (. means /app)

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .
# first (.) means my current project directory in vscode and second (.) means the docker /app
# It will copy all the vscode project files to dockers /app folder
# COPY takes source and destination


EXPOSE 8000
# Not necessary (usally we add port mappingin docker run command)


CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
# 0.0.0.0 means the server inside the container can accept connections all network interfaces
# By exposing 8000 and mapping it here 0.0.0.0:8000 we can access it from outside the container


