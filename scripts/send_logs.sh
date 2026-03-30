#!/bin/bash
USER_ID="1532701"
TOKEN="${GRAFANA_TOKEN}"
LOKI_URL="https://logs-prod-024.grafana.net/loki/api/v1/push"
if [ -z "$TOKEN" ]; then
    echo "Erro: GRAFANA_TOKEN não configurado"
    exit 1
fi
TIMESTAMP=$(date +%s000000000)
curl -s -u "${USER_ID}:${TOKEN}" -H "Content-Type: application/json" -X POST "${LOKI_URL}" -d "{\"streams\":[{\"stream\":{\"job\":\"soc-lab\"},\"values\":[[\"${TIMESTAMP}\",\"event=test\"]]}]}"
echo "Logs enviados!"
