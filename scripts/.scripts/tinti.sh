#!/bin/bash

# tinti.sh - color value format converter

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'
BOLD='\033[1m'

to_usage() {
    echo -e "${BOLD}Usage:${RESET}"
    echo -e "  tinti.sh [${CYAN}<target_format>${RESET}] ${GREEN}<color_value>${RESET}"
    echo -e "\n${BOLD}Targets:${RESET}"
    echo -e "  ${CYAN}-hex${RESET}, ${CYAN}-rgb${RESET}, ${CYAN}-hsl${RESET}, ${CYAN}-cmyk${RESET}, ${CYAN}-ansi${RESET}"
    echo -e "  (If no target format is provided, all formats are printed)"
    echo -e "\n${BOLD}Examples:${RESET}"
    echo -e "  tinti.sh ${CYAN}-rgb${RESET}   ${GREEN}#289304${RESET}"
    echo -e "  tinti.sh ${CYAN}-hex${RESET}   ${GREEN}45 243 102${RESET}"
    echo -e "  tinti.sh          ${GREEN}#FF5733${RESET}"
    echo -e "  tinti.sh          ${GREEN}255 87 51${RESET}"
    echo ""
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$#" -eq 0 ]; then
    to_usage
    exit 0
fi

case "$1" in
    -hex|-rgb|-hsl|-cmyk|-ansi)
        TARGET_FORMAT=$1
        shift
        ;;
    -*)
        echo -e "${RED}${BOLD}Error:${RESET}${RED} Unknown target format ${CYAN}'$1'${RESET}${RED}.${RESET}"
        exit 1
        ;;
    *)
        TARGET_FORMAT="-all"
        ;;
esac

if [ "$#" -eq 1 ]; then
    HEX_RAW=${1#\#}

    if [ ${#HEX_RAW} -eq 3 ]; then
        R_CHAR=${HEX_RAW:0:1}
        G_CHAR=${HEX_RAW:1:1}
        B_CHAR=${HEX_RAW:2:1}
        HEX_RAW="${R_CHAR}${R_CHAR}${G_CHAR}${G_CHAR}${B_CHAR}${B_CHAR}"
    fi

    # Extract RGB components
    R=$((16#${HEX_RAW:0:2}))
    G=$((16#${HEX_RAW:2:2}))
    B=$((16#${HEX_RAW:4:2}))

elif [ "$#" -eq 3 ]; then
    R=$1
    G=$2
    B=$3
else
    echo -e "${RED}${BOLD}Error:${RESET}${RED} Invalid input format.${RESET}"
    echo -e "Provide either a single ${CYAN}Hex${RESET} value or three ${CYAN}RGB${RESET} integers."
    exit 1
fi

print_colored() {
    local r="$1" g="$2" b="$3" text="$4"
    printf "\n   \033[48;2;%d;%d;%dm   \033[0m   \033[38;2;%d;%d;%dm%s\033[0m\n\n" "$r" "$g" "$b" "$r" "$g" "$b" "$text"
}

to_hex() {
    local r="$1" g="$2" b="$3"
    local val=$(printf "#%02X%02X%02X" "$r" "$g" "$b")
    print_colored "$r" "$g" "$b" "$val"
}

to_rgb() {
    local r="$1" g="$2" b="$3"
    local val="rgb($r, $g, $b)"
    print_colored "$r" "$g" "$b" "$val"
}

to_hsl() {
    local r="$1" g="$2" b="$3"
    local val=$(awk -v r="$r" -v g="$g" -v b="$b" 'BEGIN {
        r=r/255; g=g/255; b=b/255;

        max=r;
        if(g>max) max=g;
        if(b>max) max=b;

        min=r;
        if(g<min) min=g;
        if(b<min) min=b;

        d = max - min;
        l = (max + min) / 2;

        if (d == 0) {
            h = 0; s = 0;
        } else {
            s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
            if (max == r) {
                h = (g - b) / d + (g < b ? 6 : 0);
            } else if (max == g) {
                h = (b - r) / d + 2;
            } else {
                h = (r - g) / d + 4;
            }
            h = h / 6;
        }
        printf "hsl(%.0f, %.0f%%, %.0f%%)", h*360, s*100, l*100;
    }')
    print_colored "$r" "$g" "$b" "$val"
}

to_cmyk() {
    local r="$1" g="$2" b="$3"
    local val=$(awk -v r="$r" -v g="$g" -v b="$b" 'BEGIN {
        r=r/255; g=g/255; b=b/255;

        max=r;
        if(g>max) max=g;
        if(b>max) max=b;

        k = 1 - max;

        if (k == 1) {
            c = 0; m = 0; y = 0;
        } else {
            c = (1 - r - k) / (1 - k);
            m = (1 - g - k) / (1 - k);
            y = (1 - b - k) / (1 - k);
        }
        printf "cmyk(%.0f%%, %.0f%%, %.0f%%, %.0f%%)", c*100, m*100, y*100, k*100;
    }')
    print_colored "$r" "$g" "$b" "$val"
}

to_ansi() {
    local r="$1" g="$2" b="$3"
    local val="fg(\\033[38;2;${r};${g};${b}m)   bg(\\033[48;2;${r};${g};${b}m)"
    print_colored "$r" "$g" "$b" "$val"
}

case "$TARGET_FORMAT" in
    -hex)
        to_hex "$R" "$G" "$B"
        ;;
    -rgb)
        to_rgb "$R" "$G" "$B"
        ;;
    -hsl)
        to_hsl "$R" "$G" "$B"
        ;;
    -cmyk)
        to_cmyk "$R" "$G" "$B"
        ;;
    -ansi)
        to_ansi "$R" "$G" "$B"
        ;;
    -all)
        to_hex "$R" "$G" "$B"
        to_rgb "$R" "$G" "$B"
        to_hsl "$R" "$G" "$B"
        to_cmyk "$R" "$G" "$B"
        to_ansi "$R" "$G" "$B"
        ;;
esac

