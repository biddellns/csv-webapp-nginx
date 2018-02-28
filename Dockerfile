FROM nginx:stable

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip 
    
RUN  pip3 install --upgrade pip 
RUN  rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/nginx.conf
RUN rm /etc/nginx/mime.types
COPY conf.d/nginx.conf /etc/nginx/nginx.conf
COPY conf.d/mime.types /etc/nginx/mime.types

RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
