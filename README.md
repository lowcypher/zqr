# zqr
QrCodes com Linux, Shell e Zenity

Em 17 de Setembro de 2015 escrevi um pouco sobre os tal de QrCode.
Para ler o artigo, acesse http://www.mariomedeiros.eti.br/artigos/index.php?article29/codigos-de-barras-qrcode

Na época eu fiz um script para ser utilizado em modo texto para criar os códigos.
Depois de alguns outros estudos e curiosidades sobre a geração dos códigos, acabei por fazer algumas alterações.
Adicionei algumas opções a mais e utilizei o zenity para deixar mais simples a geração dos códigos.

O script novo gera o qrcode com base em 4 tipos de entradas.
1 - um texto simples e curto digitado direto no campo do formulário;
2 - gera o código baseado num arquivo de texto com os dados;
3 - gera o código baseado num arquivo de texto com os dados e adiciona uma imagem de logotipo no centro da imagem do código qr;
4 - gera um qrcode para acesso à rede Wi-Fi.

Obs0: as dependências para a utilização do script são:

qrencode: gerador de QRCode

imagemagick: manipulador de imagens

zenity: gerador de janelas 

gthumb: visualizador de imagens 

Obs1: utilizei o gthumb para visualizar as imagens porque era o que estava "à mão" para a tarefa. Pode-se utilizar 
qualquer visualizador para isso. Deve-se somente mudar no código.

Obs2: para a geração do código com logotipo centralizado, é necessário o uso do Imagemagick, conforme consta na lista de 
dependências do script.

Criei um pacote com os arquivos para teste e uso.
Nele constam:
arquivo zqr.sh (o script em si);
arquivo de imagem tux.png (para uso no logotipo);
arquivo de texto dados.txt com os dados (para uso na geração com base em arquivo texto).

Não tem muito o que dizer sobre o código.
O que fiz foi coletar partes prontas de outros códigos, tanto alguns meus como os de sites e forums diversos e ler a 
documentação do site do zenity.

Tentei comentar o melhor possível, mas é basicamente auto-explicativo o código do script.

Muita coisa não deu certo no começo, mas isso foi mais porque esse "desenvolvedor" 
que vos escreve é muito relapso e tem um raciocínio ímpar, assim como a quantidade de neurônios, 
que no caso é um só mesmo (por isso o ímpar).

O resultado final ficou até que "usável". Talvez eu faça algo em PHP futuramente, 
apesar de já existirem várias ferramentas prontas para isso, então seria mais para efeito de estudo do que para uso prático.
