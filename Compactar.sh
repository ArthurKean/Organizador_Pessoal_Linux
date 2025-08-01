#!/bin/bash

BASE="/c/Users/User/Desktop/Organizador pessoal"
IMAGENS="/c/Users/User/Desktop/Organizador pessoal/Organizados/Imagens"
BACKUP="/c/Users/User/Desktop/Organizador pessoal/Backup"
LOGS="/c/Users/User/Desktop/Organizador pessoal/Logs_C"

mkdir -p "$BASE/Backup" "$BASE/Logs_C"

#Pega data atual
DATA=$(date +%Y%m%d)
#Define o Log
ARQ_LOG="$LOGS/limpeza_e_backup_${DATA}.log"
#Caminho do arquivo do backup
ARQ_BACKUP="$BACKUP/imagens_${DATA}.tar.gz"

# Compacta a pasta imagens
tar -czf "$ARQ_BACKUP" -C "$IMAGENS" .

# Conta arquivos compactados
NUM_ARQS=$(find "$IMAGENS" -type f | wc -l)

# Log do backup
echo "$(date '+%Y-%m-%d') Backup criado: $ARQ_BACKUP tendo $NUM_ARQS arquivos." >> "$ARQ_LOG"
