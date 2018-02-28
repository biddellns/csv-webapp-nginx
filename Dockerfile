FROM nginx:stable

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

RUN rm -rf /var/lib/apt/lists/*
    
RUN pip3 install --upgrade pip 
RUN pip3 install Jinja2 

RUN rm /etc/nginx/nginx.conf
RUN rm /etc/nginx/mime.types
COPY conf.d/nginx.conf /etc/nginx/nginx.conf
COPY conf.d/mime.types /etc/nginx/mime.types

RUN rm /etc/nginx/conf.d/default.conf

RUN mkdir /utilities
COPY utilities/ /utilities
COPY ["entrypoint.sh", "install.py", "default.conf.j2", "/" ]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
