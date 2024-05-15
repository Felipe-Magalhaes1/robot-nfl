*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse a NFL
Test Teardown    Fechar o navegador


Library    String
Library    BuiltIn

*** Test Cases ***


 Fazer login
    # [Tags]    TesteLogin 
    [Tags]    apresentacaoLogin
    Dado que eu navegue até o menu login
    E preencha meus dados
    Então aperto o botão login
    

# Cenario Login alternativo = FUNCIONANDO
Cenario login email errado
    # [Tags]    TesteLogin
    [Tags]    apresentacaoLogin
    Dado que o usuario navegue até a aba login
    E preencha o email errado
    Então uma mensagem de erro deve aparecer 

# Cenario Login alternativo = FUNCIONANDO 
Cenario login senha errada
    [Tags]    TesteLogin
    Dado que o usuario navegue até a aba login
    E preencha a senha errada
    Então uma mensagem de erro deve aparecer 
   
# Cenario Login alternativo = FUNCIONANDO
Cenario login apenas email preenchido
    [Tags]    TesteLogin
    Dado que o usuario navegue até a aba login
    E preencha apenas o email
    Então o botão sign in deve estar indisponivel

# Cenario Login alternativo = FUNCIONANDO
Cenario login apenas senha preenchida
    [Tags]    TesteLogin
    Dado que o usuario navegue até a aba login
    E preencha apenas a senha
    Então o botão sign in deve estar indisponivel
    

# Cenario Login alternativo = FUNCIONANDO
Cenario login Esqueci a senha email inexistente 
# testei alguns casos nesse cenario e vi alguns pontos: o campo envia mensagem de erro apenas se preencher um email com menos de 5 caracteres, 2- o mesmo se o email não existir, uma mensagem é enviada
    [Tags]    TesteLogin
    Dado que o usuario navegue até a aba login
    E tente entrar pelo google sem preencher email
    Então clicar no botão login e confirmar msg enviada


Procurar a noticia mais recente e assistir o video
    # [Tags]    TesteNoticia
    [Tags]    apresentacaoNoticia
    Dado que eu procure uma noticia  
    E escolha a noticia desejada
    Entao assisto os melhores momentos
    Sleep    5s

# Cenario Noticia alternativo  = FUNCIONANDO
Procurar a ultima noticia do menu principal
    [Tags]    TesteNoticia
    Dado que o usuario navegue até noticias
    E navegue na pagina
    Então clica na ultima noticia postada

# Cenario Noticias alternativo = FUNCIONANDO
Não passar o mouse por cima do video para fullscreen
    [Tags]    TesteNoticia
    Dado que o usuario navegue até noticias
    E escolha a noticia desejada
    Então verifico a função fullscreen

# Cenario Noticias alternativo = FUNCIONANDO 
Verificar se uma noticia antiga saiu das recentes
    [Tags]    TesteNoticia
    Dado que o usuario navegue até noticias
    E navegue pela pagina noticias
    Então verifico que uma noticia antiga não deve aparecer no menu

# Cenario Noticias alternativo = FUNCIONANDO
Navegar até aba todas noticias e selecionar 
    # [Tags]    TesteNoticia
    [Tags]    apresentacaoNoticia
    Dado que o usuario navegue até noticias
    E navegue até o menu todas noticias
    Então seleciona uma noticia
    

Navegar pelos times e ver stats
    # [Tags]    TesteTimesStats
    [Tags]    apresentacaoTimesStats
    Dado que eu navegue pelos times
    E clique em stats
    Entao eu vejo as stats completas de determinado ano

# Cenario times stats alternativo = FUNCIONANDO
Navegar pelos times de outra forma 
     [Tags]    TesteTimesStats
     Dado que o usuario clique no menu teams
     E selecione um time
     Então navega nas stats do time

# Cenario time stats alternativo = FUNCIONANDO

Verificar se um jogador de determinado time não está em uma data incorreta
    # [Tags]    TesteTimesStats
    [Tags]    apresentacaoTimesStats
    Dado que eu navegue pelos times
    E clique em stats
    Entao verifico se o jogador não aparece em um ano errado

# Cenario time stats alternativo = FUNCIONANDO
Verificar se um jogador de determinado time está na data correta
    [Tags]    TesteTimesStats
    Dado que eu navegue pelos times
    E clique em stats
    Então verifico se o jogodar está presente na data correta
    
# Cenario time stats alternativo = FUNCIONANDO
Verificar se a data limite (1996) ainda possui status
    [Tags]    TesteTimesStats
    Dado que eu navegue pelos times
    E clique em stats
    Então faço um teste para verificar campo extremo


Procurar um jogador em especifico
    # [Tags]    TesteProcurarJogador
    [Tags]    apresentacaoProcurarJogador
    Dado que eu procure um jogador
    E selecione a lupa
    Entao seleciono o jogador pesquisado

# Cenario procurar jogador alternativo = FUNCIONANDO
Jogador pesquisado não exista
    # [Tags]    TesteProcurarJogador
    [Tags]    apresentacaoProcurarJogador
    Dado que o usuario navegue até jogadores
    E pesquise um jogador que não existe
    Então uma mensagem de sem resultados deve aparecer

# Cenario procurar jogador alternativo = FUNCIONANDO
Jogador pesquisado com um caractere errado
    [Tags]    TesteProcurarJogador
    Dado que o usuario navegue até jogadores
    E digite um jogador existente, porém com um caracter a mais 
    Então uma mensagem de sem resultados deve aparecer

# Cenario procurar jogador alternativo = FUNCIONANDO
Jogador ativo na aba jogador aposentado
    [Tags]    TesteProcurarJogador
    Dado que o usuario navegue até jogadores
    E clique na aba "aposentados" e preencha com um jogador ativo
    Então uma mensagem de sem resultados deve aparecer

# Cenario procurar jogador alternativo = FUNCIONANDO    
Jogador aposentado na aba de jogador ativo
    [Tags]    TesteProcurarJogador
    Dado que o usuario navegue até jogadores
    E pesquise um jogador aposentado na aba de jogadores ativos
    Então uma mensagem de sem resultados deve aparecer
    
Pesquisar um jogo 
    # [Tags]    TestePesquisarJogo
    [Tags]    apresentacaoPesquisarJogo
    Dado que eu navegue até o menu login
    E preencha meus dados
    E aperto o botão login
    E navegue no menu score
    E selecione o ano e o evento
    Então baixo o relatorio do jogo

#Cenario Pesquisar jogo alternativo = FUNCIONANDO
Tentar pesquisar um jogo sem estar logado
    # [Tags]    TestePesquisarJogo
    [Tags]    apresentacaoPesquisarJogo
    Dado que o usuario tente buscar um jogo
    E selecione a opção Highlights
    Então deve ir para o formulario login

#Cenario Pesquisar jogo alternativo = FUNCIONANDO
Um jogo de 2020 não pode estar visível no ano de 2021
    [Tags]    TestePesquisarJogo
    Dado que o usuario verifique o SuperBowl do ano 2021 e do ano 2020
    E selecione a data
    Então verifique que não existe um time errado

#Cenario Pesquisar jogo alternativo = FUNCIONANDO
Selecionar a equipe desejada e selecionar ultimo jogo jogado
    [Tags]    TestePesquisarJogo
    Dado que eu navegue até o menu login
    E preencha meus dados
    E aperto o botão login
    E o usuario queria ver o ultimo jogo de determiado time
    Então baixo o relatorio do jogo

#Cenario Pesquisar jogo alternativo = FUNCIONANDO
Verificar se o ultimo ano do menu (2017)
    [Tags]    TestePesquisarJogo
    Dado que o usuario navegue até a aba score
    E selecione o ultimo ano do menu
    Então determiado jogo deve ser visivel 
    
   


    