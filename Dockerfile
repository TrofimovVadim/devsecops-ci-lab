FROM python:3.12-alpine
RUN apk update && apk upgrade --no-cache && \
pip install --no-cache-dir --upgrade pip setuptools>=78.1.1 wheel
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --chown=appuser:appgroup . .
USER appuser 
EXPOSE 8080
CMD ["python", "-m", "http.server", "8080"]
