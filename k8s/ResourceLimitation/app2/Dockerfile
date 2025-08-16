FROM python:3.14.0rc2
RUN apt-get update -y
RUN apt-get install stress-ng -y
COPY ./app /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["python", "app.py"]