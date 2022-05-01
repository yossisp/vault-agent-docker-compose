apk add jq

export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root
vault secrets enable -version=2 kv
vault auth enable approle
vault policy write admin-policy /helpers/admin-policy.hcl
vault write auth/approle/role/dev-role token_policies="admin-policy"
vault read -format=json auth/approle/role/dev-role/role-id \
  | jq -r '.data.role_id' > /helpers/role_id
vault write -format=json -f auth/approle/role/dev-role/secret-id \
  | jq -r '.data.secret_id' > /helpers/secret_id