
# Install nerd fonts (JetBrains Mono)

JETBRAINS_FONTS_DIR="$HOME/.local/share/fonts/JetBrains"
if [ -d "$JETBRAINS_FONTS_DIR" ]; then
    echo "Font directory '$JETBRAINS_FONTS_DIR' already exists. Skipping."
    exit 0
fi

echo "Downloading JetBrains Mono font to '$JETBRAINS_FONTS_DIR'..."
mkdir -p $JETBRAINS_FONTS_DIR

PREFIX=https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures

# Python code to generate the following lines
#for font_name in ["Bold", "Bold Italic", "ExtraBold", "ExtraBold Italic", "ExtraLight", "ExtraLight Italic", "Italic", "Light", "Light Italic", "Medium", "Medium Italic", "Regular", "SemiBold", "SemiBold Italic", "Thin", "Thin Italic"]:
#    print(f"""curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-{font_name.replace(" ", "-")}-Nerd-Font-Complete.ttf" $PREFIX/{font_name.replace(" ", "")}/complete/JetBrains%20Mono%20{font_name.replace(" ", "%20")}%20Nerd%20Font%20Complete.ttf""")

curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Bold-Nerd-Font-Complete.ttf" $PREFIX/Bold/complete/JetBrains%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Bold-Italic-Nerd-Font-Complete.ttf" $PREFIX/BoldItalic/complete/JetBrains%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-ExtraBold-Nerd-Font-Complete.ttf" $PREFIX/ExtraBold/complete/JetBrains%20Mono%20ExtraBold%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-ExtraBold-Italic-Nerd-Font-Complete.ttf" $PREFIX/ExtraBoldItalic/complete/JetBrains%20Mono%20ExtraBold%20Italic%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-ExtraLight-Nerd-Font-Complete.ttf" $PREFIX/ExtraLight/complete/JetBrains%20Mono%20ExtraLight%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-ExtraLight-Italic-Nerd-Font-Complete.ttf" $PREFIX/ExtraLightItalic/complete/JetBrains%20Mono%20ExtraLight%20Italic%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Italic-Nerd-Font-Complete.ttf" $PREFIX/Italic/complete/JetBrains%20Mono%20Italic%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Light-Nerd-Font-Complete.ttf" $PREFIX/Light/complete/JetBrains%20Mono%20Light%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Light-Italic-Nerd-Font-Complete.ttf" $PREFIX/LightItalic/complete/JetBrains%20Mono%20Light%20Italic%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Medium-Nerd-Font-Complete.ttf" $PREFIX/Medium/complete/JetBrains%20Mono%20Medium%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Medium-Italic-Nerd-Font-Complete.ttf" $PREFIX/MediumItalic/complete/JetBrains%20Mono%20Medium%20Italic%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Regular-Nerd-Font-Complete.ttf" $PREFIX/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-SemiBold-Nerd-Font-Complete.ttf" $PREFIX/SemiBold/complete/JetBrains%20Mono%20SemiBold%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-SemiBold-Italic-Nerd-Font-Complete.ttf" $PREFIX/SemiBoldItalic/complete/JetBrains%20Mono%20SemiBold%20Italic%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Thin-Nerd-Font-Complete.ttf" $PREFIX/Thin/complete/JetBrains%20Mono%20Thin%20Nerd%20Font%20Complete.ttf
curl -fL --output "$JETBRAINS_FONTS_DIR/JetBrains-Mono-Thin-Italic-Nerd-Font-Complete.ttf" $PREFIX/ThinItalic/complete/JetBrains%20Mono%20Thin%20Italic%20Nerd%20Font%20Complete.ttf

if command -v fc-cache --version >/dev/null 2>&1; then
    echo "Updating fonts cache..."
    fc-cache -f
fi
