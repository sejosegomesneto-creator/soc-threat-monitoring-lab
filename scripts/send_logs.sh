#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Pegar credenciais das variáveis de ambiente
USER_ID="${GRAFANA_USER_ID:-1532701}"
TOKEN="${GRAFANA_TOKEN}"
LOKI_URL="https://logs-prod-024.grafana.net/loki/api/v1/push"

if [ -z "$TOKEN" ]; then
    echo -e "${YELLOW}⚠️  GRAFANA_TOKEN não configurado!${NC}"
    echo "Exporte seu token: export GRAFANA_TOKEN='seu-token'"
    exit 1
fi

echo -e "${YELLOW}📤 Enviando logs para o Loki...${NC}"

TIMESTAMP=$(date +%s000000000)

curl -s -u "${USER_ID}:${TOKEN}" \
  -H "Content-Type: application/json" \
  -X POST "${LOKI_URL}" \
  -d "{
    \"streams\": [{
      \"stream\": {\"job\": \"soc-lab\"},
      \"values\": [
        [\"${TIMESTAMP}\", \"event=login_failed user=root ip=192.168.1.100 severity=high attack=bruteforce\"],
        [\"${TIMESTAMP}\", \"event=login_failed user=admin ip=192.168.1.101 severity=high attack=bruteforce\"],
        [\"${TIMESTAMP}\", \"event=port_scan ip=192.168.1.150 severity=medium attack=portscan\"],
        [\"${TIMESTAMP}\", \"event=malware_detected ip=192.168.1.200 severity=critical attack=malware\"],
        [\"${TIMESTAMP}\", \"event=sql_injection ip=10.0.0.50 severity=high attack=sqlinjection\"]
      ]
    }]
  }"

echo -e "\n${GREEN}✅ Logs enviados com sucesso!${NC}"
