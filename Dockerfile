FROM python:3.9-slim
ENV LOG_INTERVAL=5
RUN adduser --disabled-password appuser
COPY main.py .
RUN chown appuser:appuser main.py
# USER appuser
CMD ["python3", "main.py"]
