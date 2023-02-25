# SMT-NodeRed-Official
NodeRed Official API Connection to SmartMeterTexas

This is a NodeRed implimentation to the official API.  In order to use this, will have to complete the following:
  1. Get your Public IP
  2. Use LetsEncrypt to get a SSL Certificate (note, you cannot use a wildcard cert, it must have a specific domain in the subject field)
  3. Call SMT to initiate the API process. They will email you, and you will need to provide your Public IP address and the certificate in the email.
  4. ONce they have accepted your certificate and whitelisted your IP, you can use this config.

## Creds
The Credentials node contains all the information you need to update, including your username, password, ESIID, and meter number.  All of these are required because the payloads require them.

You will need to add node-red-contrib-credentials to your palette.

## SSL Certificate
The SSL Certificate is in all of the POST requests, so you will need to update the TLS Configuration section of both requests. I recommend NOT using the default LE integration paths, (/ssl/fullchain.pem), but instead uploading the files manually.  I use the LE integration, and the VSCode integration to get the contents of /ssl.  When creating a new tls-config, you will need to upload both the cert and the private key, but only send the cert to SMT.

## MQTT
I send the rwa kWh to smt/reading via MQTT, I have an NQTT section in my configuration.yaml, that i have in its own file: mqtt: !include configs/mwtt.yaml

## Delays
I included a Manual Read, and Manual Request buttons, this is for the few times an error occurs that i have not already caught.  If you have suggestions or other catches, we can collectively update this repo.

There are a few delays, they are to account for SMT collecting the data, and needing to wait for the asyncronus model of SMT.
