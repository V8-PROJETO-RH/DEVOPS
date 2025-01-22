FROM python:3.12.5-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/V8-PROJETO-RH/BACKEND-IA.git

WORKDIR /app/BACKEND-IA/application/IA-MVP/

RUN pip install --no-cache-dir -r requeriments.txt

EXPOSE 8084

CMD ["python", "main.py"]

