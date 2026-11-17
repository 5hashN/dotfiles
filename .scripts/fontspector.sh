#!/bin/sh

set -eu

has_fcscan=0
if command -v fc-scan >/dev/null 2>&1; then
    has_fcscan=1
fi

print_section() {
    printf "\n\033[1m--- %s ---\033[0m\n\n" "$1"
}

print_section "terminal environment"
echo "term:             ${TERM:-unknown}"
echo "colorterm:        ${COLORTERM:-none}"

if [ -n "${KITTY_WINDOW_ID:-}" ]; then
    echo "terminal app:     kitty"
elif [ -n "${ALACRITTY_LOG:-}" ]; then
    echo "terminal app:     alacritty"
elif [ -n "${WEZTERM_EXECUTABLE:-}" ]; then
    echo "terminal app:     wezterm"
elif [ "${TERM_PROGRAM:-}" = "iTerm.app" ]; then
    echo "terminal app:     iterm2"
elif [ "${TERM_PROGRAM:-}" = "Apple_Terminal" ]; then
    echo "terminal app:     apple terminal"
else
    echo "terminal app:     ${TERM_PROGRAM:-generic posix terminal}"
fi

print_section "style specimen"
printf "\033[2mThe quick brown fox jumps over the lazy dog (faint)\033[0m\n"
printf "\033[0mThe quick brown fox jumps over the lazy dog (regular)\033[0m\n"
printf "\033[1mThe quick brown fox jumps over the lazy dog (bold)\033[0m\n"
printf "\033[3mThe quick brown fox jumps over the lazy dog (italic)\033[0m\n"
printf "\033[4mThe quick brown fox jumps over the lazy dog (underline)\033[0m\n"
printf "\033[9mThe quick brown fox jumps over the lazy dog (strikethrough)\033[0m\n"
printf "\033[1;3mThe quick brown fox jumps over the lazy dog (bold italic)\033[0m\n"

print_section "monospace alignment grid"
echo "0123456789012345678901234567890123456789"
echo "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLM"
echo "abcdefghijklmnopqrstuvwxyzabcdefghijklm"
echo "|||||||||||||||||||||||||||||||||||||||"
echo "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"
echo "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
echo "O0o1lI|!S5s\$2Zz8B9qgpqy4A@#%&*(){}[]<>"

print_section "ascii (32-126)"
echo " !\"#\$%&'()*+,-./"
echo "0123456789:;<=>?"
echo "@ABCDEFGHIJKLMNO"
echo "PQRSTUVWXYZ[\\]^_"
echo "\`abcdefghijklmno"
echo "pqrstuvwxyz{|}~"

print_section "extended ascii (160-255)"
echo " ¡¢£¤¥¦§¨©ª«¬­®¯"
echo "°±²³´µ¶·¸¹º»¼½¾¿"
echo "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ"
echo "ÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß"
echo "àáâãäåæçèéêëìíîï"
echo "ðñòóôõö÷øùúûüýþÿ"

print_section "greek & cyrillic"
echo "greek upper:    Α Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω"
echo "greek lower:    α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ σ τ υ φ χ ψ ω"
echo "cyrillic upper: А Б В Г Д Е Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я"
echo "cyrillic lower: а б в г д е ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я"

print_section "math, logic & technical"
echo "basic math:   ± × ÷ ≈ ≠ ≤ ≥ ∞ ∑ ∏ √ ∫ ∂ ∆ ∇ ‰ ‱ ∝ ∟ ∠ ∡ ∢ ∥ ∦ ∧ ∨ ∩ ∪ ∴ ∵"
echo "set theory:   ∈ ∉ ∋ ∌ ⊂ ⊃ ⊆ ⊇ ⊄ ⊅ ⊆ ⊇ ⊈ ⊉ ⊊ ⊋ ∅ ℵ"
echo "logic:        ∀ ∃ ∄ ∴ ∵ ∶ ∷ ∸ ∹ ∺ ∻ ├ ╞ ╟ ╠ ╡ ╢ ╣ ╤ ╥ ╦ ╧ ╨ ╩ ╪ ╫ ╬"
echo "fractions:    ½ ⅓ ⅔ ¼ ¾ ⅕ ⅖ ⅗ ⅘ ⅙ ⅚ ⅛ ⅜ ⅝ ⅞ ⅉ ⅍ ⅎ"
echo "control keys: ⌘ ⌥ ⇧ ⎋ ⌫ ⌦ ⏎ ⏏ ⌶ ⌷ ⌸ ⌹ ⌺ ⌻ ⌼ ⌽ ⌾ ⌿ ⍀"
echo "punctuation:  « » \" \" ' ' – — … • † ‡ § ¶ © ® ™"
echo "currency:     $ € £ ¥ ₹ ₿ ¢ ¤ ₣ ₱ ₩ ₸ ₺ ₴ ₲ ₳ ₵ ₭ ₪ ₫ ₡"

print_section "superscript & subscript"
echo "super numbers:  ⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺ ⁻ ⁼ ⁽ ⁾"
echo "sub numbers:    ₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₊ ₋ ₌ ₍ ₎"
echo "super letters:  ᵃ ᵇ ᶜ ᵈ ᵉ ᶠ ᵍ ʰ ⁱ ʲ ᵏ ˡ ᵐ ⁿ ᵒ ᵖ ʳ ˢ ᵗ ᵘ ᵛ ʷ ˣ ʸ ᶻ"
echo "sub letters:    ₐ ₑ ₕ ᵢ ⱼ ₖ ₗ ₘ ₙ ₒ ₚ ᵣ ₛ ₜ ᵤ ᵥ ₓ"

print_section "box drawing & blocks"
echo "single box:   ┌─┬─┐ ├─┼─┤ └─┴─┘"
echo "double box:   ╔═╦═╗ ╠═╬═╣ ╚═╩═╝"
echo "heavy box:    ┏━┳━┓ ┣━╋━┫ ┗━┻━┛"
echo "rounded box:  ╭─┬─╮ ├─┼─┤ ╰─┴─╯"
echo "diagonals:    ╱ ╲ ╳ ╴ ╵ ╶ ╷ ╸ ╹ ╺ ╻ ╼ ╽ ╾ ╿"
echo "blocks:       ▀  ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▌ ▍ ▎ ▏ ▐ ░ ▒ ▓"
echo "quadrants:    ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟"

print_section "braille patterns"
echo "⡀ ⡄ ⡆ ⡇ ⡏ ⡟ ⡿ ⣿  ⢀ ⢠ ⢰ ⢹ ⢽ ⢿ ⣿  ⠄ ⠆ ⠇ ⠏ ⠟ ⠿ ⣿  ⠠ ⠤ ⠦ ⠧ ⠯ ⠿ ⣿"
echo "⠀ ⠁ ⠂ ⠃ ⠄ ⠅ ⠆ ⠇ ⠈ ⠉ ⠊ ⠋ ⠌ ⠍ ⠎ ⠏ ⠐ ⠑ ⠒ ⠓ ⠔ ⠕ ⠖ ⠗ ⠘ ⠙ ⠚ ⠛ ⠜ ⠝ ⠞ ⠟"

print_section "powerline & nerd font glyphs"
echo "powerline:                       "
echo "extra glyphs:                  "

if [ "${1:-}" != "" ] && [ -f "$1" ]; then
    print_section "font file metadata ($1)"
    if [ "$has_fcscan" -eq 1 ]; then
        fc-scan --format "family:     %{family}\nstyle:      %{style}\nfull name:  %{fullname}\npostscript: %{postscriptname}\nversion:    %{version}\n" "$1"
    else
        echo "fc-scan tool not found. install fontconfig to inspect raw font file headers."
    fi
fi

echo ""

