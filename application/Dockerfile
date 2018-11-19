FROM ubuntu:17.10

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

COPY requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt

COPY . /

EXPOSE 80

ENTRYPOINT ["gunicorn", "vulnerable.wsgi:application", "--bind", "0.0.0.0:80"]