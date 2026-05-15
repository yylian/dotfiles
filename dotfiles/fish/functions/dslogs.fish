function dslogs
  kubectl logs --follow --tail=500 -n platform deploy/sovity-deploy-server-v2-next \
    | jq -Rr '
        . as $raw |
        try (fromjson |
          if .timestamp then
            # OTEL / deploy-server format
            "[" + .timestamp + "] " + .severityText +
            " | " + .body +
            (if .attributes["de.sovity.deploy_server.deployment.id"]
              then " | deployment=" + .attributes["de.sovity.deploy_server.deployment.id"]
              else "" end) +
            (if .attributes["exception.message"]
              then "\n  ERROR: " + (.attributes["exception.message"] | gsub("\n"; "\n  "))
              else "" end) +
            (if .traceId then " | traceId=" + .traceId else "" end)
          elif .["@timestamp"] then
            # Terraform UI JSON format
            "[" + .["@timestamp"] + "] " + (.["@level"] | ascii_upcase) +
            " | " + .["@message"] +
            (if .type then " | type=" + .type else "" end) +
            (if .hook.resource.addr then " | resource=" + .hook.resource.addr else "" end) +
            (if .changes then
              " | +" + (.changes.add | tostring) +
              " ~" + (.changes.change | tostring) +
              " -" + (.changes.remove | tostring)
              else "" end) +
            (if .diagnostic then
              "\n  " + (.diagnostic.severity | ascii_upcase) + ": " + .diagnostic.summary +
              (if .diagnostic.detail and .diagnostic.detail != ""
                then "\n  " + .diagnostic.detail else "" end)
              else "" end)
          elif .time then
            # Terragrunt format
            "[" + .time + "] " + (.level | ascii_upcase) +
            " | " + (.msg | rtrimstr("\n")) +
            (if .["working-dir"] then " | dir=" + .["working-dir"] else "" end)
          else $raw
          end
        ) catch ("(unparsed) " + $raw)
      '
end
