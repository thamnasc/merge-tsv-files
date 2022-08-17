#!/bin/bash

function get_header_and_urls
{
    # count the header
    declare -i COUNTER_LINES=1

    # read row by row
    while IFS=$'\t' read -ra row
    do
        # verify if the first column contains a commentary
        if [[ "# " == *"${row[1]}"* ]]; then
            COUNTER_LINES=$((COUNTER_LINES+1))
        fi
        
    done < "$1"

    # create a new file with the header and comments
    cat $1 | head -$COUNTER_LINES > gbn-fonts.tsv

    # save the rows to skip
    echo $COUNTER_LINES
}

function build_tsv_file 
{
    FILES=('gbn-fonts-0.tsv' 'gbn-fonts-1.tsv' 'gbn-fonts-2-fim.tsv' 'gbn-fonts-3_part_0(final).tsv' 'gbn-fonts-3_part_1_(2)' 'gbn-fonts-3_part_2_done' 'gbn-fonts-3_part_3.txt' 'gbn-fonts-3_part_4_(final).tsv' 'gbn-fonts-4_FInalOficial.tsv')
    for file in "${FILES[@]}"; do
        # take every line skipping the first $1 ones
        # concatenate at the end of the existing file
        cat $file | tail -n +$1 >> gbn-fonts.tsv
    done
}

LINES=$(get_header_and_urls $1)
build_tsv_file $LINES

