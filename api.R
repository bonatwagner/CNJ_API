## Inicia a API de forma a rodar como um serviço na máquina local --------------
## Prof. Wagner Hugo Bonat · LEG/UFPR ------------------------------------------

## nohup Rscript api.R > api.log 2>&1 &

library(plumber)
pr("plumber.R") |> pr_run(host = '0.0.0.0', port = 8000)

