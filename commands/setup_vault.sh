setup_vault() {
  echo "Add the following to your env. ie ~/.bash_profile"
  echo "export VAULT_ADDR=https://vault.optiturn.com"
  echo "Then run:"
  echo "vault login -method=ldap username=<VPN_USERNAME>"
}
