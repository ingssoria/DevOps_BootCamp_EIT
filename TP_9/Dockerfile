# FROM nginx:alpine
# WORKDIR /usr/share/nginx/html
# COPY ./index.html .
# VOLUME /usr/share/nginx/html

# # Execute nginx server
# CMD ["/bin/sh",  "-c",  "exec nginx -g 'daemon off;'"]

FROM node:20.6-alpine3.17 AS builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY ./src/app.js ./src/
RUN npm run build

