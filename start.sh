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

while sleep 158; do curl https://shielded-tor-22656.herokuapp.com -s && curl -s 'https://rarbga.herokuapp.com/jsonrpc' -H 'content-type: application/json;charset=UTF-8' -H 'accept: application/json, text/plain, */*' --data-binary '{"id":"myID","jsonrpc":"2.0","method":"aria2.addUri","params":["token:'$TOKEN'",["magnet:?xt=urn:btih:E0D00667650ABA9EE05AACBBBD8B55EA8A51F534&dn=The.Shawshank.Redemption.1994.1080p.BRRip-YTS&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969%2Fannounce&tr=udp%3A%2F%2F9.rarbg.to%3A2710%2Fannounce&tr=udp%3A%2F%2Ftracker.internetwarriors.net%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.cyberia.is%3A6969%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Fexplodie.org%3A6969%2Fannounce&tr=http%3A%2F%2Ftracker1.itzmx.com%3A8080%2Fannounce&tr=udp%3A%2F%2Ftracker.tiny-vps.com%3A6969%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce"],{"dir":"downloads/RARBGx264"}]}' ; done
