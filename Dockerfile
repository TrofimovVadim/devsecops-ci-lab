FROM python:3.12-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --chown=appuser:appgroup . .
USER appuser 
EXPOSE 8080
CMD ["python", "-m", "http.server", "8080"]
