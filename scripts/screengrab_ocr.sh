#!/usr/bin/env bash
# TODO set defaults
source ~/.config/slurp/colours.sh

SCREENSHOTFILE=/tmp/ocr_screenshot_$(date +%Y_%m_%d_%H_%M_%S).png
OCRFILE=/tmp/ocr_text_$(date +%Y_%m_%d_%H_%M_%S)
OCROUTPUTFILE="${OCRFILE}.txt"

echo $OCROUTPUTFILE

grim -g "$(slurp -d -b $background -c $marquee)" $SCREENSHOTFILE

# TODO add a check for if screenshotfile got generated

tesseract -l eng $SCREENSHOTFILE $OCRFILE

wl-copy $(cat $OCROUTPUTFILE)

# TODO add an icon and part of the text 
notify-send "screengrab ocr" "copied ocr text to clipboard"
