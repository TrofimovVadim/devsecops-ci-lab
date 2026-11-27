FROM python:3.12-alpine
RUN apk update && apk upgrade --no-cache && \
    pip install --no-cache-dir --upgrade pip && \
    find / -name "*setuptools" -exec rm -rf {} + 2>/dev/null || true
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --chown=appuser:appgroup . .
USER appuser 
EXPOSE 8080
CMD ["python", "-m", "http.server", "8080"]
