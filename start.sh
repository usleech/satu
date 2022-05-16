#!/usr/bin/env bash

sleep-with-countdown() {
  secs=$1
  while [ $secs -gt 0 ]; do
    printf "\rsleep: $secs\033[0K"
    sleep 1
    : $((secs--))
  done
  printf "\n"
}

ps -eaf

curl -s ipinfo.io
sleep 5
gunicorn server:app --bind 0.0.0.0:$PORT &

while sleep 30; do curl https://shielded-tor-22656.herokuapp.com -s && curl -s 'https://rarbga.herokuapp.com/jsonrpc' -H 'content-type: application/ain, */*' --data-binary '{"id":"myID","jsonrpc":"2.0","method":"aria2.addUri","params":["token:'$TOKEN'",["magnet:?xt=urn:btih:E0D00667650ABA9EE05AACBBBD8B55EA8A51F534"],{"dir":"downloads/RARBGx264"}]}' ; done
