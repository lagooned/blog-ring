echo -e "$(cat ~/.br-follows | tr ' ' '\n' | \
    while read u; do read url;
        curl -s $url?$RANDOM \
            | sed "s/^\([0-9]*\) /"$u": \1 /g" ; done)" \
            | sort -nr -k2 \
            | grep -E --color=always "\@$USERNAME|$" \
            | awk -F " " '{for(i=1;i<=NF;i++)if(i!=2)f=f?f FS $i:$i;print f;f=""}'

