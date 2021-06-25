export PRIVATEKEY="tls.key"
export PUBLICKEY="tls.crt"
export SECRETNAME="mycustomkeys"

openssl req -x509 -nodes -newkey rsa:4096 -keyout "$PRIVATEKEY" -out "$PUBLICKEY" -subj "/CN=sealed-secret/O=sealed-secret"
