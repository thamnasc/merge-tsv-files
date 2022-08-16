#!/bin/bash

function get_header_and_urls
{
    cat $1 | head -1 >> gbn-fonts.tsv
    COUNTER_LINES=$(1)
    #STR='# '
    #for ROW in $(cat $1)
    #do
        #if [[ $STR =~ "$ROW" ]]; then
       #     COUNTER_LINES=$((COUNTER_LINES+1))
      #      ROW >> gbn-fonts.tsv
     #   fi
    #done

    local COUNTER=$(cat $1 | awk -v counter=$COUNTER_LINES -F "\t" '{
        for (i=1; i<=NF; i++)
        {
            if(index($1, "# ") != 0)
            {
                
                counter++;
            }
        }
        print counter;
    }')

    echo $COUNTER_LINES
}

HEADER=$(get_header_and_urls $1)
echo $HEADER linhas
#print $1 >> "gbn-fonts.tsv";
#FILES=("gbn-fonts-1.tsv", "gbn-fonts-2.tsv", "gbn-fonts-3.tsv")
#print $1 >> "gbn-fonts.tsv";