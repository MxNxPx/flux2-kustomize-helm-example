export PRIVATEKEY="mytls.key"
export PUBLICKEY="mytls.crt"
export SECRETNAME="mycustomkeys"

openssl req -x509 -nodes -newkey rsa:4096 -keyout "$PRIVATEKEY" -out "$PUBLICKEY" -subj "/CN=sealed-secret/O=sealed-secret"
