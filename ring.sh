echo -e "$(cat ~/.br-follows | tr ' ' '\n' | \
    while read u; do read url;
        curl -s $url?$RANDOM \
            | sed "s/^\([0-9]*\) /"$u": \1 /g" ; done)" \
            | sort -nr -k2 \
            | awk '{$2 = "\b"; print $0}' \
            | grep -E --color=always "\@$USERNAME|$"

