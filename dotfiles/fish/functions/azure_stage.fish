function azure_stage
    azure_clear
    bw get notes Env-Credentials-Stage | source
    set -gx ARM_STAGE staging
    set -e ARM_PROD
end
