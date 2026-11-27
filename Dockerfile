FROM alpine:latest
RUN apk update && apk upgrade --no-cache && \
    apk add --no-cache python3 && \
    addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --chown=appuser:appgroup . .
USER appuser 
EXPOSE 8080
CMD ["python", "-m", "http.server", "8080"]
