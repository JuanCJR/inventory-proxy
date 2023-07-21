# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx


COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN apt-get update && apt-get install -y openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj /C=CL/ST=Santiago/L=Santiago/O=Testing


EXPOSE 443


# Copy the default nginx.conf

