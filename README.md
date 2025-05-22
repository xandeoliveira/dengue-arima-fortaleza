# Previsão de Casos de Dengue em Fortaleza com Modelos ARIMA

Este repositório contém um projeto de análise de séries temporais voltado para a previsão do número de casos de dengue na cidade de Fortaleza, Ceará, utilizando modelos estatísticos da família ARIMA. O objetivo é auxiliar na compreensão e antecipação de surtos da doença, contribuindo para estratégias de prevenção e controle.

## 📈 Objetivo

Desenvolver e treinar modelos ARIMA para prever a incidência semanal de casos de dengue em Fortaleza, com base em dados históricos. A previsão precisa desses casos pode ser uma ferramenta valiosa para autoridades de saúde pública na implementação de medidas preventivas e alocação de recursos.

## 🗂 Estrutura do Repositório

* `dataset/`: Conjunto de dados utilizados para treinamento e validação dos modelos.
* `graficos/`: Visualizações geradas durante a análise exploratória e avaliação dos modelos.
* `modelos/`: Arquivos relacionados aos modelos ARIMA desenvolvidos.
* `notebooks/`: Notebooks Jupyter contendo o processo de análise e modelagem passo a passo.
* `predicoes/`: Resultados das previsões geradas pelos modelos treinados.
* `arima-fortaleza.R`: Script principal para treinamento e avaliação dos modelos ARIMA.

## 🧪 Metodologia

1. **Análise Exploratória de Dados (EDA)**: Investigação inicial dos dados para entender padrões, tendências sazonais.
2. **Pré-processamento**: Tratamento de dados e remoção de variáveis exógenas.
3. **Modelagem com ARIMA**: Aplicação de modelos ARIMA para capturar a dinâmica temporal dos casos de dengue.
4. **Avaliação de Modelos**: Utilização de métricas como RMSE e MAE para avaliar o desempenho dos modelos.
5. **Geração de Previsões**: Produção e análise de previsões futuras.

## 🧠 Tecnologias Utilizadas

* **Linguagens**: R, Python.
* **Bibliotecas**: R: `forecast`, `ggplot2`, `tseries`; Python: `pandas`, `numpy`, `statsforecast`, `sklearn`, `matplotlib`, `seaborn`, `os`.
* **Ferramentas**: Jupyter Notebook para documentação e apresentação dos resultados.

## 📊 Resultados Esperados

Espera-se que os modelos ARIMA desenvolvidos sejam capazes de prever com precisão os casos de dengue em Fortaleza, permitindo uma resposta mais rápida e eficaz das autoridades de saúde. A análise também pode revelar insights sobre a sazonalidade e fatores que influenciam a propagação da doença.

## 📄 Licença

Este projeto está licenciado sob a Licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.