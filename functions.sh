#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file
# To avoid conflicts, name your function like this
# pg_XX_myfunction () { }
# pg for PluGin
# XX is a short code for your plugin, ex: ww for Weather Wunderground
# You can use translations provided in the language folders functions.sh

pg_api_ai_request() {
  stt_encoded=$(pg_api_ai_urlencode "$pg_api_ai_stt")
  result_curl=$(curl -s "https://api.api.ai/api/query?v=20150910&query=$stt_encoded&lang=fr&sessionId=$pg_api_ai_session_id" \
                  -H "Authorization:Bearer $pg_api_ai_bearer" \
               )
  echo $result_curl | jq '.result.fulfillment.speech'
}

# From https://gist.github.com/cdown/1163649
pg_api_ai_urlencode() {
    # urlencode <string>

    local LANG=C
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;; 
        esac
    done
}

pg_api_api_urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}
