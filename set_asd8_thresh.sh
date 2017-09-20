#!/bin/bash
    httpi_port=1234
    tdc=1130
    threshx=$(printf "%04x" $1)
    threshd=$(printf "thr_%05d" $1)
    echo "setting thresh $threshd = 0x$threshx"
    for chan in 0 1 2 3; do
    curl http://localhost:${httpi_port}/commands/put.pl?${tdc}-d400-3${chan}${threshx}-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-1-1
    curl http://localhost:${httpi_port}/commands/put.pl?${tdc}-d400-3${chan}${threshx}-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-2-1
    curl http://localhost:${httpi_port}/commands/put.pl?${tdc}-d400-3${chan}${threshx}-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-4-1
    curl http://localhost:${httpi_port}/commands/put.pl?${tdc}-d400-3${chan}${threshx}-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-8-1
    done
