FROM python:3

LABEL author="Christoph Hermes"

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY src /app

ENV MONGODB_SERVER localhost
EXPOSE 5000

CMD ["python3", "app.py"]

