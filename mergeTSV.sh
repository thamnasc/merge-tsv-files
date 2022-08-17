#!/bin/bash

function get_header_and_urls
{
    declare -i COUNTER_LINES=1

    while IFS=$'\t' read -ra row
    do
        if [[ "# " == *"${row[1]}"* ]]; then
            COUNTER_LINES=$((COUNTER_LINES+1))
        fi
        
    done < "$1"

    cat $1 | head -$COUNTER_LINES > gbn-fonts.tsv

    echo $COUNTER_LINES
}

function build_tsv_file 
{
    FILES=("gbn-fonts-1.tsv", "gbn-fonts-2-fim.tsv", "gbn-fonts-3_part_0(final).tsv",
    "gbn-fonts-3_part_1", "gbn-fonts-3_part_1_(2)", "gbn-fonts-3_part_2_done", 
    "gbn-fonts-3_part_3.txt", "gbn-fonts-3_part_4_(final).tsv", "gbn-fonts-4_FInalOficial.tsv")
    
    FILE=("gbn-fonts-1.tsv")
    for file in ${FILE[@]}; do
        echo $file | tail -n +$1 >> gbn-fonts.tsv
    done
}

LINES=$(get_header_and_urls $1)
build_tsv_file $LINES
echo $LINES linhas

