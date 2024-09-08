#!/bin/bash

declare -A cache  # Declare an associative array for caching

fibo_cached() {
    local n=$1
    if (( n < 2 )); then
        echo "$n"
        return
    fi

    if [[ -n "${cache[$n]}" ]]; then
        echo "${cache[$n]}"
        return
    fi

    local val1=$(fibo_cached $((n - 1)))
    local val2=$(fibo_cached $((n - 2)))

    local val=$((val1 + val2))
    cache[$n]=$val  # Cache the result

    echo "$val"
}

fibo_cached "$1"