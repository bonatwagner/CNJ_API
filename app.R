## Inicia a API de forma a rodar como um serviço na máquina local --------------
## Prof. Wagner Hugo Bonat · LEG/UFPR ------------------------------------------
library(plumber)
pr("plumber.R") |> pr_run(port = 8000)

