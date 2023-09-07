function azure_prod
    azure_clear
    bw get notes Env-Credentials-Prod | source
    set -gx ARM_PROD production
    set -e ARM_STAGE
end
