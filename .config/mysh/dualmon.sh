#        _       _                _      
#       | |     | |              (_)     
#   __ _| |_ __ | |__   __ ___  ___ _ __ 
#  / _` | | '_ \| '_ \ / _` \ \/ / | '__| Shivaji Chalise (alphajr)
# | (_| | | |_) | | | | (_| |>  <| | |    http://www.github.com/shivajichalise
#  \__,_|_| .__/|_| |_|\__,_/_/\_\ |_|   
#         | |                   _/ |     
#         |_|                  |__/      
#
# This script checks if a device is connected to VGA if yes then extends the display

#!/bin/bash

xeval=${eval}
xxrandr="xrandr --output VGA-1 --auto --right-of LVDS-1 && i3-msg restart"
co="xrandr | grep -c ' connected '"

#eval $co
if [[ $(eval $co) -gt 1 ]]
  then
  eval $xxrandr
else
  xrandr --auto
fi
