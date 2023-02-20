#!/bin/sh

#-------CUSTOMISATION---------

playing_symbol=""
paused_symbol=""
symbols_color="#e3734e"
font_symbol_index="2"
font_text_index="1"

#-----------------------------

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" != "Playing" ] && [ "$player_status" != "Paused" ]; then
    echo ""
    exit 0
fi

artist="$(playerctl metadata artist)"
title="$(playerctl metadata title)"
track_lbl="${artist} - ${title}"
track_lbl_length=${#track_lbl}
track_lbl="$(cut -c1-30 <<< ${track_lbl})"
if [ "$track_lbl_length" -ge 30 ]; then
    track_lbl="${track_lbl}..."
fi

if [ "$player_status" = "Playing" ]; then
    echo "%{T${font_symbol_index}}%{F${symbols_color}}${playing_symbol} %{F-}%{T-}%{T${font_text_index}}${track_lbl}%{T-}"
elif [ "$player_status" = "Paused" ]; then
    echo "%{T${font_symbol_index}}%{F${symbols_color}}${paused_symbol} %{F-}%{T-}%{T${font_text_index}}${track_lbl}%{T-}"
else
    echo ""
fi 
