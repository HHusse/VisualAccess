FROM python:3.11

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 50051

CMD ["python", "server.py"]
