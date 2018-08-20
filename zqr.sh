#!/bin/bash
#
#Gerador de QRCode com qrencode e zenity
#
#Autor: Mario Medeiros
#Data: 2017-09-05
#Nome: zqr
#Versao: 0.1-Z
#
#Dependências:
#
#qrencode: gerador de QRCode
#zenity: gerador de janelas
#gthumb: visualizador de imagens
#
##############################################

#aqui começa o menu de opções

while true; do
  choice="$(zenity --width=400 --height=430 --list --column "Gerar QRCode" --title="ZQR" \
  "QRCode Texto Curto" \
  "QRCode Arquivo Texto" \
  "QRCode LogoTipo" \
  "QRCode WiFi" \
  "Sair" \
  )"

  case "${choice}" in

  "QRCode Texto Curto" )

#aqui é solicitado o nome do arquivo que será o qrcode e depois
#o texto que estará no código
nome=$(zenity --entry --text="Digite o nome do QRCode" --title="Texto Para o QRCode") 
texto=$(zenity --entry --text="Digite o Texto") 

#o echo lê a variável da segunda janela e grava em arquivo txt
echo $texto > texto.txt

#o cat direciona a saída para o qrencode para gerar o arquivo 
#com o nome especificado na primeira janela 
cat texto.txt | qrencode -s 15 -o $nome.png

#essa parte do script dá opção chamar o gthumb para visualizar o arquivo gerado
#adicionei nas 4 opções, como pode ver no restante do código.
zenity --question --text="Deseja Visualizar o QRCode Gerado?"
case $? in
0)
gthumb $nome.png
;;
esac 

;;

  "QRCode Arquivo Texto" )

#aqui o diálogo file-selection mostra os arquivos no diretório local do script para
#pegar o arquivo de texto 
arquivo=$(zenity --file-selection --filename --text="Selecione Arquivo Texto" --title="Arquivo Para QRCode")

#esta parte mostra o conteúdo do arquivo numa janela
#serve somente para conferir se o arquivo de texto é o que possui
#os dados escolhidos
zenity --text-info --filename=$arquivo

#o nome do arquivo qr é iserido aqui
nome=$(zenity --entry --text="Nome do QRCode" )

#o cat direciona a saída para o qrenconde para gerar o arquivo
#com o nome especificado na janela de nome
cat $arquivo | qrencode -s 15 -o $nome.png

#menu de opção de visualização do arquivo qr gerado.
zenity --question --text="Deseja Visualizar o QRCode Gerado?"
case $? in
0)
gthumb $nome.png
;;
esac 

;;

  "QRCode LogoTipo" )

#aqui é dado o aviso sobre o tipo de arquivo de texto a ser utilizado
zenity --warning --text="Escolha o arquivo TXT com o texto \nO arquivo deve estar no formato de texto plano"

#aqui o diálogo file-selection mostra os arquivos no diretório local do script para
#pegar o arquivo de texto 
arquivo=$(zenity --file-selection --filename --text="Selecione Arquivo Texto" --title="Arquivo Para QRCode")

#aqui é dado o aviso sobre o tipo de arquivo de imagem a ser utilizado
zenity --warning --text="Escolha a IMAGEM que será o logo no QRCode \nA IMAGEM LogoTipo deve ser no máximo 300x300\nVerifique o tamanho e proporções da IMAGEM a ser utilizada!!"

#aqui o diálogo file-selection mostra os arquivos no diretório local do script para
#pegar o arquivo de imagem do logotipo
img=$(zenity --file-selection --filename --text="Selecione Imagem LogoTipo" --title="LogoTipo Para QRCode")
zenity --text-info --filename=$arquivo

#parte do código que abra a janela para nomear o arquivo final qrcode
nome=$(zenity --entry --text="Nome do QRCode" )

#o cat direciona a saída para o qrenconde para gerar o arquivo
#com o nome especificado na janela de nome e adiciona a imagem logotipo no centro da 
#imagem/arquivo qrcode
cat $arquivo | qrencode -s 15 -l H -o $nome | composite -gravity center $img $nome $nome-final.png

#menu de opção de visualização do arquivo qr gerado.
zenity --question --text="Deseja Visualizar o QRCode Gerado?"
case $? in
0)
gthumb $nome-final.png
;;
esac 

;;

  "QRCode WiFi" )

#aviso sobre o formato do nome do arquivo
zenity --warning --text="Após o nome do arquivo, adicione a extensão. Ex: redefaifai.png"


#janelas de nome da imagem qr, nome da rede wifi e a senha da rede
#no final é mostrado o menu de opção de visualização do arquivo qr gerado.
qrencode -s 15 -o $(zenity --entry --text="Nome IMG QR" --title="Nome da Imagem QR") "WIFI:S:$(zenity --entry --text="Network name (SSID)" --title="Create WiFi QR");T:WPA;P:$(zenity --password --title="Wifi Password");;".png

zenity --question --text="Deseja Visualizar o QRCode Gerado?"
case $? in
0)
gthumb .
#sleep 1
#sudo s2disk
;;
esac 

;;
      *)
            break
          ;;
        esac
done
