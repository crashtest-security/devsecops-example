FROM python:3.6-alpine3.6

COPY requirements.txt /requirements.txt
RUN pip install -r requirements.txt

COPY . /

EXPOSE 8080

ENTRYPOINT ["gunicorn", "vulnerable.wsgi:application", "--bind", "0.0.0.0:8080"]