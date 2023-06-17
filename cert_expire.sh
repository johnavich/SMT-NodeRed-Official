#!/bin/bash
if ! $(openssl x509 -in /media/fullchain.pem -noout -checkend 86400 >/dev/null)
then
    cp /ssl/fullchain.pem /media/fullchain.pem
    cp /ssl/privkey.pem /media/privkey.pem
fi
