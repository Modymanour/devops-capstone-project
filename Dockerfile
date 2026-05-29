From python:3.9-slim

WORKDIR /app
copy requirements.txt .
run pip install --no-cache-dir -r requirements.txt

copy service/ ./service/
RUN useradd --uid 1000 theia && chown -R theia /app
USER theia

expose 8080
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]
