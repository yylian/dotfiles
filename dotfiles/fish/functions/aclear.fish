function aclear
	set -e ARM_TENANT_ID
    set -e ARM_SUBSCRIPTION_ID
    set -e ARM_CLIENT_ID
    set -e ARM_CLIENT_CERTIFICATE_PATH
    set -e ARM_CLIENT_CERTIFICATE_PASSWORD
    set -e KEYCLOAK_CLIENT_SECRET
    set -e KEYCLOAK_CLIENT_ID
    set -e KEYCLOAK_REALM

    set -e ARM_PROD
    set -e ARM_STAGE
end
