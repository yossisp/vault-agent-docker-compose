### About

This is a minimal setup to get Vault server and Vault Agent running on docker-compose.

### How To Run

- `source startVault.sh`

Vault Agent is now available at `http://localhost:8200`.

### Test
- `curl --request POST -H "Content-Type: application/json" \
--data '{"data":{"foo":"bar"}}' http://localhost:8200/v1/secret/data/hello`

- `curl http://localhost:8200/v1/secret/data/hello`