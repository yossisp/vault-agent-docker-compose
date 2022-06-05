### About

This is a minimal setup to get Vault server and Vault Agent running on docker-compose. Vault server uses file storage backend which makes this a persistent setup (a docker volume is mounted), so that tokens data will persist after running machine restart or `docker-compose down`.

### How To Run

- `source startVault.sh`

Vault Agent is now available at `http://localhost:8200`.
Vault ui is available at `http://localhost:8201/ui`. In order to log into the ui use the value of `root_token` field in `./helpers/key.json` file at the token (using token login method in the ui).

### Test
- `curl --request POST -H "Content-Type: application/json" --data '{"data":{"foo":"bar"}}' http://localhost:8200/v1/kv/data/hello`

- `curl http://localhost:8200/v1/kv/data/hello`

### How To Remove Vault Data
Run `source delete-vault-volume.sh`.
