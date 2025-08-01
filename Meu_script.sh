#!/bin/bash

#Guardando os caminhos dos arquivos,caso já existam!
BASE="/c/Users/User/Desktop/Organizador pessoal"
ARQUIVOS="/c/Users/User/Desktop/Organizador pessoal/Arquivos para organizar"
FEITO="/c/Users/User/Desktop/Organizador pessoal/Organizados"
LOGS="/c/Users/User/Desktop/Organizador pessoal/Logs"
ARQ_LOG="c:/Users/User/Desktop/Organizador pessoal/Logs/organizacao.log"

#Cria os diretórios caso não existam ainda!
mkdir -p "$FEITO/Documentos" "$FEITO/Imagens" "$FEITO/Outros" "$LOGS"

#Percorre todos os arquivos da BASE
for arq in "$ARQUIVOS"/*; do
    #Verifica sé é um arquivo, excluir pastas e essas coisas
    if [ -f "$arq" ]; then
        #Pega o nome do arquivo sem o caminho
        nome=$(basename -- "$arq")
      
        #Verifica o tipo de arquivo
        #Cada tem sua sintaxe(verificar)
        extensao="${nome##*.}"
        pasta_destino=""

        #Tipo if no linux(Vários)
        case "$extensao" in
            pdf|doc|xlsx|pptx)
                pasta_destino="$FEITO/Documentos"
                ;;
            jpg|png|gif|jpeg)
                pasta_destino="$FEITO/Imagens"
                ;;
            *)
                pasta_destino="$FEITO/Outros"
                ;;
        esac

        #Move os arquivos para o destino correto
        mv "$arq" "$pasta_destino/"

        #Sistema de Log
        echo "Movido: $nome → $pasta_destino" >> "$ARQ_LOG"
    fi
done