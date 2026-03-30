# Queries LogQL

## Total de eventos
`count_over_time({job="soc-lab"}[24h])`

## Por severidade
`sum by (severity) (count_over_time({job="soc-lab"}[24h]))`

## Top IPs atacantes
`topk(5, sum by (ip) (count_over_time({job="soc-lab"}[24h])))`
