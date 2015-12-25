# PsDocker
PowerShell functions for interacting with the Docker Remote API

### Authentication
This module requires that a pfx file is created and then imported into the user store in order to authenticate.
If using the Docker Quickstart terminal, the files needed are normally stored in:
"C:\Users\<username>\.docker\machine\machines\default"
run the following to generate a pfx file from cert.pem/key.pem:
`openssl pkcs12 -inkey key.pem -in cert.pem -export -out cert.pfx`
The resulting pfx should then be imported into the user cert store. Make a note of the thumbprint of the certificate, 
as that is what's used to reference it when using `Connect-PsDocker`