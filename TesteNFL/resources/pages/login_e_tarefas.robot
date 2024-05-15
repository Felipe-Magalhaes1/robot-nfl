*** Settings ***
Resource    ../main.robot

Library    OperatingSystem

*** Variables ***

${HEADERS}    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36
${MENU_LOGIN}    //a[@data-value='gigya_sign_in']
${PREENCHER_EMAIL}    //input[@type='email' and @id='email-input-field']     
${PREENCHER_SENHA}    //input[@type='password' and @id='password-input-field']  
${CLIQUE_LOGIN}    //button[@aria-label='Sign In']
${MENU_NOTICIA}     class=d3-o-nav__item-label
${PRIMEIRA_NOTICIA_MENU}    class=d3-o-media-object__figure
${BOTAO_FULLSCREEN}    //div[@aria-label='FULLSCREEN ENTER']
${MENU_TIMES}    //a[@title='Teams']
${TIME_BALTIMORE}    //a[@aria-label='Baltimore Ravens']
${TIME_BALTIMORE_2}    //a[@href='/teams/baltimore-ravens/stats']
${TODAS_STATS}    //span[@class='nfl-o-footer-strip__link-text' and text()='VIEW ALL TEAM STATS']
${SELECIONAR_ANO}    //*[@id="year-dropdown"]
${MENU_PLAYERS}    //a[@title='Players']
${LUPA_JOGADOR}     //input[@id='player-search-input']
${SELECIONAR_JOGADOR}    //button[@id='player-search-button']
${MENU_SCORE}     //a[@title='Scores']


*** Keywords ***
 
 Dado que eu navegue até o menu login
        Click Element   ${MENU_LOGIN}
        Sleep    2s
E preencha meus dados
        Input Text    ${PREENCHER_EMAIL}    felipe_m.souza@hotmail.com 
        Click Element    //*[@id="__next"]/div/div/div/div/div[3]/button/div/div/div/div   
        Sleep    3s
        Input Password    ${PREENCHER_SENHA}   Teletronix123#
        

Então aperto o botão login
        Click Button    ${CLIQUE_LOGIN}
        Sleep    7s

E aperto o botão login
        Click Button    ${CLIQUE_LOGIN}
        Sleep    10s
   
   

Dado que eu procure uma noticia 
    Click Element    ${MENU_NOTICIA}

E escolha a noticia desejada
    # Sleep    15s
    # Click Element    //*[@id="onesignal-slidedown-cancel-button"]
    Click Element    ${PRIMEIRA_NOTICIA_MENU}
Então verifico a função fullscreen
    Execute JavaScript    window.scrollBy(0, 400)
    Sleep    4s
    Element Should Not Be Visible    ${BOTAO_FULLSCREEN}
Entao assisto os melhores momentos
    Sleep    3s
    Mouse Over    css:.css-view-175oi2r
    Click Element    ${BOTAO_FULLSCREEN}



Dado que eu navegue pelos times
    Mouse Over    ${MENU_TIMES}
    Sleep    4s
    Click Element    ${TIME_BALTIMORE}

E clique em stats
    Click Element    ${TIME_BALTIMORE_2}
    Sleep    2s

# exemplo de teste errado abaixo: nao pressionar o enter dps de selecionar o ano
Entao eu vejo as stats completas de determinado ano 
    Click Element    ${TODAS_STATS}
    Execute JavaScript    window.scrollBy(0, 900)
    Sleep    2s
    Click Element    ${SELECIONAR_ANO}
    Select From List By Value    ${SELECIONAR_ANO}    /team/stats/2018/REG
    Press Key    ${SELECIONAR_ANO}    \\13
    Press Key    ${SELECIONAR_ANO}    \\27
    Execute JavaScript    window.scrollBy(0, 450)
    Sleep    5s
    
Entao verifico se o jogador não aparece em um ano errado
    Click Element    ${TODAS_STATS}
    Execute JavaScript    window.scrollBy(0, 900)
    Sleep    2s
    Click Element    ${SELECIONAR_ANO}
    Select From List By Value    ${SELECIONAR_ANO}    /team/stats/2010/REG
    Press Key    ${SELECIONAR_ANO}    \\13
    Press Key    ${SELECIONAR_ANO}    \\27
    Sleep    3s
    Execute JavaScript    window.scrollBy(0, 450)
    Page Should Not Contain    Lamar Jackson
    Sleep    3s

Então verifico se o jogodar está presente na data correta
    Click Element    ${TODAS_STATS}
    Execute JavaScript    window.scrollBy(0, 900)
    Sleep    2s
    Click Element    ${SELECIONAR_ANO}
    Select From List By Value    ${SELECIONAR_ANO}    /team/stats/2005/REG
    Press Key    ${SELECIONAR_ANO}    \\13
    Press Key    ${SELECIONAR_ANO}    \\27
    Execute JavaScript    window.scrollBy(0, 450)
    Page Should Contain     Kyle Boller
    Sleep    3s
    

Então faço um teste para verificar campo extremo
    Click Element    ${TODAS_STATS}
    Execute JavaScript    window.scrollBy(0, 900)
    Sleep    2s
    Click Element    ${SELECIONAR_ANO}
    Select From List By Value    ${SELECIONAR_ANO}    /team/stats/1996/REG
    Press Key    ${SELECIONAR_ANO}    \\13
    Press Key    ${SELECIONAR_ANO}    \\27
    Execute JavaScript    window.scrollBy(0, 450)
    Sleep    2s
    Page Should Contain    Bam Morris
    Sleep    3s
       
    
Dado que eu procure um jogador
    Click Element    //span[contains(@class, 'nfl-o-icon') and contains(@class, 'nfl-o-icon--small')]
    Click Element    ${MENU_PLAYERS}
    Input Text    ${LUPA_JOGADOR}    Patrick Mahomes

 E selecione a lupa
    Click Element    ${LUPA_JOGADOR}
   
Entao seleciono o jogador pesquisado
    Click Element    ${SELECIONAR_JOGADOR}
    Sleep    1s
    Execute JavaScript    window.scrollBy(0, 150)
    Click Element    //td/div[@class='d3-o-media-object']
    Sleep    3s



Dado que eu navegue no menu score
    Click Element   ${MENU_SCORE}

E navegue no menu score
    Click Element   ${MENU_SCORE}

    
E selecione o ano e o evento
    Sleep    4s
    Click Element    //select[@data-test-id='facemask-select-container']
    Sleep    1s
    Click Element    //select[@data-test-id='facemask-select-container']/option[@value='2020']
    Press Keys    //select[@data-test-id='facemask-select-container']    \27
    Sleep    3s
    # Click Element    id=Week
    # Sleep    1s
    # Click Button    //select[@id='Week']/option[@value='2019-POST-2']
    Click Element    //div[text()='Highlights']
    Sleep    2s

Então baixo o relatorio do jogo
    Sleep    3s
    Click Element    //input[@type='checkbox' and @role='switch']
    Execute JavaScript    window.scrollBy(0, 150)
    Sleep    2s
    Click Element    //div[@aria-label='DOWNLOAD']
    Sleep    3s


#                   CENARIOS ERRADOS
# LOGIN

Dado que o usuario navegue até a aba login
    Click Element   //a[@data-value='gigya_sign_in']
    Sleep    2s
E preencha o email errado
    Input Text    //input[@type='email' and @id='email-input-field']    felipe123_m.souza@hotmail.com
    Sleep    2s
    Input Password    //input[@type='password' and @id='password-input-field']    Teletronix123#
    Click Button    //button[@aria-label='Sign In']
Então uma mensagem de erro deve aparecer 
    Wait Until Element Is Visible    //div[@role='alert']
    Sleep    3s


E preencha a senha errada
    Input Text    //input[@type='email' and @id='email-input-field']    felipe_m.souza@hotmail.com
    Input Password    //input[@type='password' and @id='password-input-field']    Teletronix123#123
    Click Button    //button[@aria-label='Sign In']

E preencha apenas o email
    Input Text    //input[@type='email' and @id='email-input-field']    felipe_m.souza@hotmail.com
    Press Key    //input[@type='email' and @id='email-input-field']    \\13
    Sleep    1s

Então o botão sign in deve estar indisponivel
    Page Should Not Contain Button    //*[@id="__next"]/div/div/div[3]/div[6]/div/div/div/div/div

E preencha apenas a senha
    Input Password    //input[@type='password' and @id='password-input-field']    Teletronix123#123
    Sleep    1s
    Press Key    //input[@type='email' and @id='email-input-field']    \\13


E tente entrar pelo google sem preencher email
    Click Element    //*[@id="__next"]/div/div/div[3]/div[7]/button/div/div/div/div
    Sleep    4s
    Input Text    //*[@id="undefined-field"]    123456abcd
    Sleep    3s

Então clicar no botão login e confirmar msg enviada
    Click Element    //*[@id="__next"]/div/div/div/div[4]/button/div/div/div/div
    Sleep    2s
    Page Should Contain    Thank you!


#PROCURAR NOTICIA

E Escolhe a noticia
    Click Element   //*[@id="main-content"]/section[2]/div/div[3]/div/a
    # Click Element    class=d3-o-media-object__figure
    Execute JavaScript    window.scrollBy(0, 130)
    Sleep    3s
    Element Should Not Be Visible    //div[@aria-label='FULLSCREEN ENTER']

E navegue pela pagina noticias
    Execute Javascript    window.scrollBy(0, 80)

Então verifico que uma noticia antiga não deve aparecer no menu 
    Element Should Not Be Visible    //*[@id="main-content"]/section[4]/div/div[4]/a/figure/picture/img
    Sleep    2s
    
Dado que o usuario navegue até noticias
    Click Element    class=d3-o-nav__item-label

E navegue na pagina
    Execute Javascript    window.scrollBy(0, 120)
    Sleep    2s
Então clica na ultima noticia postada
    Click Element    //*[@id="main-content"]/section[2]/div/div[7]/div/a
    Sleep    2s
    
E navegue até o menu todas noticias
    Execute Javascript    window.scrollBy(0, 220)
    Click Element    //*[@id="main-content"]/section[2]/div/div[8]/div/a
    Sleep    2s
Então seleciona uma noticia
    Click Element    //*[@id="main-content"]/section[2]/div/div[1]/div/a
    Execute Javascript    window.scrollBy(0, 400)
    Sleep    5s
    Mouse Over    css:.css-view-175oi2r
    Click Element    ${BOTAO_FULLSCREEN}
    Sleep    5s
    

# PROCURAR JOGADOR

Dado que o usuario navegue até jogadores
    Click Element    //span[contains(@class, 'nfl-o-icon') and contains(@class, 'nfl-o-icon--small')]
    Click Element    ${MENU_PLAYERS}

E pesquise um jogador que não existe
    Input Text    ${LUPA_JOGADOR}    Cristiano Ronaldo
    Click Element    ${SELECIONAR_JOGADOR}
    Sleep    2s
Então uma mensagem de sem resultados deve aparecer
    Wait Until Page Contains    No Results. Try a different search.

E digite um jogador existente, porém com um caracter a mais 
    Input Text    ${LUPA_JOGADOR}    Patrick MahomesS
    Click Element    ${SELECIONAR_JOGADOR}
    Sleep    2s
    Wait Until Page Contains    No Results. Try a different search.

Dado que o usuario pesquise um jogador ativo na aba de jogador aposentado
    Click Element    //span[contains(@class, 'nfl-o-icon') and contains(@class, 'nfl-o-icon--small')]
    Click Element    ${MENU_PLAYERS}

E clique na aba "aposentados" e preencha com um jogador ativo
    Click Element    //*[@id="main-content"]/section[1]/div/div[1]/div[2]/div/ul/li[2]/a/span[1]
    Sleep    2s
    Input Text    ${LUPA_JOGADOR}    Patrick Mahomes
    Click Element    ${SELECIONAR_JOGADOR}
    Sleep    2s
    # Wait Until Page Contains    No Results. Try a different search.

Dado que o usuario pesquise um jogador aposentado na aba de jogador ativo
    Click Element    //span[contains(@class, 'nfl-o-icon') and contains(@class, 'nfl-o-icon--small')]
    Click Element    ${MENU_PLAYERS}
    Sleep    2s
E pesquise um jogador aposentado na aba de jogadores ativos
    Input Text    ${LUPA_JOGADOR}    Joe Montana
    Click Element    ${SELECIONAR_JOGADOR}
    Sleep    2s
    # Wait Until Page Contains    No Results. Try a different search.

    
    
# BUSCAR TIME 

 Dado que o usuario clique no menu teams
    Click Element    ${MENU_TIMES}
E selecione um time
    Click Element    //*[@id="main-content"]/section/div/div[3]/section/div/div[3]/div/div/div/div/a[1]
    Sleep    3s
Então navega nas stats do time
    Click Element    //*[@id="main-content"]/section[1]/div/div/ul/li[3]/a
    Sleep    2s
    Click Element    ${TODAS_STATS}
    Execute JavaScript    window.scrollBy(0, 1850)
    Sleep    2s
    Click Element    //*[@id="onetrust-accept-btn-handler"]
    Click Element    ${SELECIONAR_ANO}
    Select From List By Value    ${SELECIONAR_ANO}    /team/stats/2020/REG
    Press Key    ${SELECIONAR_ANO}    \\13
    Press Key    ${SELECIONAR_ANO}    \\27
    Execute JavaScript    window.scrollBy(0, 450)
    Click Element    //*[@id="main-content"]/section[2]/div/div[2]/section/div/div[2]/div/div[1]/div/div[1]/div/table/tbody/tr[1]/td[1]/a/figure/picture/img
    Execute JavaScript    window.scrollBy(0, 400)
    Sleep    5s
    
    


    


# PESQUISAR JOGO
 Dado que o usuario tente buscar um jogo
    Click Element   ${MENU_SCORE}
    Sleep    4s
    Click Element    //select[@data-test-id='facemask-select-container']
    Sleep    1s
    Click Element    //select[@data-test-id='facemask-select-container']/option[@value='2020']
    Press Keys    //select[@data-test-id='facemask-select-container']    \27
    Sleep    3s
E selecione a opção Highlights
    Click Element    //div[text()='Highlights']
    Sleep    3s
Então deve ir para o formulario login
    Click Element    //input[@type='checkbox' and @role='switch']
    Sleep    5s
    Page Should Contain    Sign In to Your NFL Account   
    Sleep    3s 

Dado que o usuario verifique o SuperBowl do ano 2021 e do ano 2020
    Click Element   ${MENU_SCORE}
    Sleep    2s
    Click Element    //select[@data-test-id='facemask-select-container']
    Sleep    1s

E selecione a data
    Click Element    //select[@data-test-id='facemask-select-container']/option[@value='2022']
    Press Keys    //select[@data-test-id='facemask-select-container']    \27
    Sleep    2s

Então verifique que não existe um time errado
    Element Should Not Be Visible    Chiefs
    Sleep    3s

    
Dado que o usuario navegue até a aba score
    Click Element   ${MENU_SCORE}
    Sleep    2s
    Click Element    //select[@data-test-id='facemask-select-container']
    Sleep    1s
E selecione o ultimo ano do menu 
    Click Element    //select[@data-test-id='facemask-select-container']/option[@value='2017']
    Press Keys    //select[@data-test-id='facemask-select-container']    \27
    Sleep    1s
    Execute Javascript    window.scrollBy(0, 170)
Então determiado jogo deve ser visivel 
    Sleep    2s
    Element Should Be Visible    //*[@id="main-content"]/div/div/div/div[2]/div/div/div[2]/div/div[3]/div/div/button/div[1]
    Sleep    2s


E o usuario queria ver o ultimo jogo de determiado time
    Mouse Over    ${MENU_TIMES}
    Sleep    2s
    Click Element    //a[@aria-label='Baltimore Ravens']
    Execute JavaScript    window.scrollBy(0, 400)
    Click Element    //*[@id="main-content"]/section[4]/div/div[1]/div/div[2]/div[1]/a
    Sleep    3s


    
   




    