#!/bin/bash
DTE=$(date '+%Y-%m-%d %T')
if ! [ -x "$(command -v openssl)" ];
then
    # Looked for, and did not find openssl.  This is required to determine if the certificate is a good certificate.
    # HA removed openssl from their base image, so we need to add it back. This will install it automatically every time, even after an update.
    echo "$DTE Openssl not installed. Installing." > /config/logs/cert.log
    apk add openssl
fi
if $(openssl x509 -in /media/fullchain.pem -noout -checkend 86400 >/dev/null)
then
    DTE=$(date '+%Y-%m-%d %T')
    echo "$DTE Cert not exipring" >> /config/logs/cert.log
else
    DTE=$(date '+%Y-%m-%d %T')
    echo "$DTE Cert expiring" >> /config/logs/cert.log
    cp /ssl/fullchain.pem /media/fullchain.pem
    cp /ssl/privkey.pem /media/privkey.pem
fi
