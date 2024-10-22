library(readxl)
dados <- read_excel("dados.xlsx")
dados$dif <- 100*dados$dif


boxplot(dados$dif)
summary(dados$dif)
library(ggplot2)
g <- ggplot(dados, aes(bol, dif))
g + geom_boxplot() +  xlab("Bolivia x Outros") +
  ylab("Desempenho em casa - desempenho fora")
cor.test(dados$dif, dados$BOL) # x e y
by(dados$dif, dados$bol, mean)
library(polycor) #pacote exigido
polyserial(dados$dif, dados$BOL)


Bolivia <- lm(dif ~ BOL, data = dados)
summary(Bolivia)
library(huxtable)
huxreg(Bolivia)


dados$ANO <- as.factor(dados$Ano)

Bolivia_md2 <- lm(dif ~ BOL + ANO, data = dados)
summary(Bolivia_md2)
huxreg(Bolivia_md2)

models <- list(Bolivia, Bolivia_md2)
huxreg(models)
library(coefplot)
coefplot(Bolivia_md2, intercept=FALSE, interactive=TRUE)
