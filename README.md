
# 🛡️ SOC Threat Monitoring Lab

Dashboard profissional de monitoramento de segurança (SOC) desenvolvido com Grafana Cloud e Loki.

## 📊 Métricas do Dashboard

| Métrica | Valor |
|---------|-------|
| Total de Eventos | 7+ logs |
| Eventos Críticos | 2 |
| IPs Atacantes | 4 |
| Tipos de Ataque | Bruteforce, Port Scan, Malware, SQL Injection |

## 🛠️ Tecnologias

- Grafana Cloud
- Loki
- LogQL
- Bash

## 🚨 Tipos de Ataque Detectados

- **Brute Force** (High): Múltiplas tentativas de login SSH
- **Port Scan** (Medium): Varredura de portas
- **Malware** (Critical): Detecção de ransomware
- **SQL Injection** (High): Tentativas de injeção SQL

## 🚀 Como Executar

```bash
git clone https://github.com/sejosegomesneto-creator/soc-threat-monitoring-lab.git
cd soc-threat-monitoring-lab
export GRAFANA_TOKEN="seu-token-aqui"
./scripts/send_logs.sh
```

## 👤 Autor

**José Gomes**
[LinkedIn](https://www.linkedin.com/in/jose-barbosa-ti)
