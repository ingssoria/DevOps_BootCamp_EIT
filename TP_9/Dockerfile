FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY ./index.html .
VOLUME /usr/share/nginx/html

# Execute nginx server
CMD ["/bin/sh",  "-c",  "exec nginx -g 'daemon off;'"]