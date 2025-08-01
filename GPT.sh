#!/bin/bash

# Definição dos caminhos (com aspas por causa dos espaços)
BASE="/c/Users/User/Desktop/Organizador pessoal"
ORIGEM="$BASE/Arquivos para organizar"
DESTINO="$BASE/Organizados"
LOGS="$BASE/Logs"
ARQ_LOG="$LOGS/organizacao.log"

# Criação das pastas necessárias, se não existirem
mkdir -p "$DESTINO/documentos" "$DESTINO/imagens" "$DESTINO/outros" "$LOGS"

# Percorre cada arquivo na pasta de origem
for arq in "$ORIGEM"/*; do
    if [ -f "$arq" ]; then
        nome=$(basename -- "$arq")
        
        # Detecta o tipo MIME real do arquivo
        tipo_mime=$(file --mime-type -b "$arq")

        case "$tipo_mime" in
            application/pdf|application/msword|application/vnd.openxmlformats-officedocument.wordprocessingml.document|application/vnd.ms-excel|application/vnd.openxmlformats-officedocument.spreadsheetml.sheet|application/vnd.ms-powerpoint|application/vnd.openxmlformats-officedocument.presentationml.presentation)
                destino_final="$DESTINO/documentos/$nome"
                ;;
            image/jpeg|image/png|image/gif)
                destino_final="$DESTINO/imagens/$nome"
                ;;
            *)
                destino_final="$DESTINO/outros/$nome"
                ;;
        esac

        mv "$arq" "$destino_final"

        echo "Movido: $nome → $destino_final" >> "$ARQ_LOG"
    fi
done
