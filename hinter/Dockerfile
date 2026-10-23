FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ ./src/

ENV HINTER_HOST=0.0.0.0 \
    HINTER_PORT=8080 \
    HINTER_LOG_DIR=/var/log/hinter \
    HINTER_CONTENT_DIR=/app/content

EXPOSE 8080

ENTRYPOINT ["python", "-m", "src.main"]
