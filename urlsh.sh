# Bash URL De/Encode script - just a wrapper round a github gist I found, which helps.

# This script is by no means my own, it's all from https://gist.github.com/cdown/1163649 - so all credit goes to cdown.

banner() {
    echo "[ URL Bash Tool ]"
    echo "- Freddie"
    echo ""
}

manual() {
    echo "[ ] Input: ";
    read INP;
    echo "";
    urlencode $INP;
}

urlencode() {
    echo -e "[-] \"${1}\""
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    echo -n "[*] "
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:$i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
    LC_COLLATE=$old_lc_collate
    echo ""
}

allencode() {
    echo -e "[-] \"${1}\""
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    echo -n "[*] "
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:$i:1}"
        printf '%%%02X' "'$c";
    done
    LC_COLLATE=$old_lc_collate  
    echo ""
}

urldecode() {
    echo -e "[-] \"${1}\""
    echo -n "[*] "
    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
    echo ""
}

help_banner() {
    echo 'Usage: urlsh -e [message] -d [encoded chars]

[Options]
 -h:            To show this message.
 -e             URL Encode special characters.
 -d             URL Decode encoded characters.
 -a             URL Encode all characters. 

 If no command-line arguments set:
 -> Allow manual input for encoding'
}

banner

if [[ -z ${@} ]]; then
    manual;
    exit 0;
fi

while getopts ":e:d:a:h" opt; do
  case $opt in
    e)export ENC=$OPTARG;
    urlencode $ENC;;
    d)export DEC=$OPTARG;
    urldecode $DEC;;
    a)export ALL=$OPTARG;
    allencode $ALL;;  
    h)
      help_banner
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    *)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
      # if no url flags set, url encode input from stdin, not command line args - could make for special chars less spooky
  esac
done

echo ""
