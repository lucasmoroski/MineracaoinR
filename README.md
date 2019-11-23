# MineracaoinR
Mineração de Dados Utilizando Shiny

Equipe: Bianca Rici Franco
        Lucas Moroski
        Patrick Marcelo
        
        
Esta aplicação tem por objetivo ser uma Aplicação Shiny dinâmica que permite a exploração de um conjunto de dados referente ao desempenho de alunos nos últimos anos do colegial, permitindo assim a análise da relação e da relevância de alguns tipos de fatores externos quantitativos no desempenho final destes alunos.

A aplicação permite a definição de três parâmetros para a contrução dos gráficos: 

** Diciplina: é possível definir se os dados a serem analisados são da disciplina de Português ou Matemática;

** Desempenho Anual: é possível escolher o desempenho/pontuação de qualquer um dos 3 anos em que foram coletados os dados;

** Fator: é possível definir com qual fator externo/pessoal se deseja relacionar a pontuação escolhida.


Os diagramas disponíveis para a análise são:

** Diagrama de Dispersão: construído pela função plot() em que é possível variar todos os 3 parâmetros;

** Diagrama de Floresta e Histograma: em que é possível variar o parâmetro "Disciplina" em uma função de regressão linear da variável G3 por todas as demais.