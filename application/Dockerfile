FROM alpine:3.4

RUN apk add --update --no-cache \
    python3

COPY requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt

COPY . /

EXPOSE 80

ENTRYPOINT ["gunicorn", "vulnerable.wsgi:application", "--bind", "0.0.0.0:80"]