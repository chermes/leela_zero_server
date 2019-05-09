FROM python:3

LABEL author="Christoph Hermes"

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

ENV MONGODB_SERVER localhost
EXPOSE 5000

COPY src /app

CMD ["python3", "app.py"]

