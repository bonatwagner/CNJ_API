## Exemplo de API que recebe parâmetros e retorna um data set ------------------
## Autor: Wagner Hugo Bonat · LEG/UFPR -----------------------------------------

# Carrega pacotes
library(plumber)
library(dplyr)

#* @apiTitle API de Filtro de Dados
#* @apiDescription Filtra o data set mtcars com base em parâmetros fornecidos na URL.

#* Filtra o data set mtcars com base nos parâmetros
#* @param cyl Número de cilindros (opcional)
#* @param mpg_min Valor mínimo de mpg (opcional)
#* @param mpg_max Valor máximo de mpg (opcional)
#* @get /filtrar
function(cyl = NULL, mpg_min = NULL, mpg_max = NULL) {
  dados <- mtcars
  dados$carro <- rownames(dados)
  
  # Conversão de tipos
  if (!is.null(cyl)) cyl <- as.numeric(cyl)
  if (!is.null(mpg_min)) mpg_min <- as.numeric(mpg_min)
  if (!is.null(mpg_max)) mpg_max <- as.numeric(mpg_max)
  
  # Aplicar filtros
  dados_filtrados <- dados %>%
    filter(
      if (!is.null(cyl)) cyl == cyl else TRUE,
      if (!is.null(mpg_min)) mpg >= mpg_min else TRUE,
      if (!is.null(mpg_max)) mpg <= mpg_max else TRUE
    )
  
  return(dados_filtrados)
}
