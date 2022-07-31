#alpine wasn't the recommended base image but for this application i went with it as it is the lightest
#and we aren't building for a production system
FROM python:3.9.13-alpine3.15

WORKDIR /app

COPY requirements.txt /app

#installing dependencies
RUN apk update && apk add --no-cache redis && pip install --no-cache-dir -r requirements.txt

#copying code
COPY ./app/ .

EXPOSE 8000

# Add non-root user
RUN addgroup -S py-rc && adduser -S py-rc -G py-rc

USER py-rc

CMD [ "./run.sh" ]