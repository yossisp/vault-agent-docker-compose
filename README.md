### About

This is a minimal setup to get Vault server and Vault Agent running on docker-compose.

### How To Run

- `docker-compose up`
- `docker exec -it vault /bin/sh`
- `source /helpers/init.sh && exit`
- `docker restart vault-agent`

Vault Agent is now available at `http://localhost:8100`.

### Test
- `curl --request POST -H "Content-Type: application/json"  \
--data '{"data":{"foo":"bar"}}' http://localhost:8100/v1/secret/data/hello`

- `curl http://localhost:8100/v1/secret/data/hello`