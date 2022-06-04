apk add jq curl

export VAULT_ADDR=http://localhost:8200
curl --request POST --data '{"secret_shares": 1, "secret_threshold": 1}' http://127.0.0.1:8200/v1/sys/init > /helpers/keys.json
export VAULT_TOKEN=$(cat /helpers/keys.json | jq -r '.root_token')
echo VAULT_TOKEN=$VAULT_TOKEN
vault operator unseal -address=${VAULT_ADDR} $(cat /helpers/keys.json | jq -r '.keys[0]')
vault login token=$VAULT_TOKEN
vault secrets enable -version=2 kv
vault auth enable approle
vault policy write admin-policy /helpers/admin-policy.hcl
vault write auth/approle/role/dev-role token_policies="admin-policy"
vault read -format=json auth/approle/role/dev-role/role-id \
  | jq -r '.data.role_id' > /helpers/role_id
vault write -format=json -f auth/approle/role/dev-role/secret-id \
  | jq -r '.data.secret_id' > /helpers/secret_id