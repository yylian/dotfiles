function aclear
	set -e ARM_TENANT_ID
    set -e ARM_SUBSCRIPTION_ID
    set -e ARM_CLIENT_ID
    set -e ARM_CLIENT_CERTIFICATE_PATH
    set -e ARM_CLIENT_CERTIFICATE_PASSWORD
    set -e KEYCLOAK_CLIENT_SECRET
    set -e KEYCLOAK_CLIENT_ID
    set -e KEYCLOAK_REALM
    set -e GRAFANA_CLOUD_API_KEY
    set -e TF_VAR_ghcr_password
    set -e TF_VAR_keycloak_admin_password

    set -e ARM_PROD
    set -e ARM_STAGE
end
