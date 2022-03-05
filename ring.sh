cat ~/.br-follows | tr ' ' '\n' | \
    while read u; do read url;
        # echo curl -s $url?$RANDOM;
        content=$(curl -s $url?$RANDOM \
            | sort -nr \
            | sed 's/^[0-9]* //g' \
            | xargs -I @ echo "$u: @" \
            | grep -E --color=always "\@$USERNAME|$");
        echo "$content"; done
