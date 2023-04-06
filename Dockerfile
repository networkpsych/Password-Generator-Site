# syntax=docker/dockerfile:1

FROM node:16.17.0-alpine3.16
WORKDIR /app
COPY . .
EXPOSE 3000
RUN apk add --update nodejs npm
RUN node -v
RUN npm -v 
RUN npm install 
CMD ["npm", "run", "dev"]
LABEL maintainer="networkpsych"