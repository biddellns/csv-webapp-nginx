#!/bin/sh

openssl req -x509 -newkey rsa:4096 -sha256 -nodes \
		-keyout key.pem -out cert.pem \
       		-subj '/CN=localhost'
