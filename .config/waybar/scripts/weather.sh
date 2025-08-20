#! /bin/bash

INXI_OUT=$(inxi -w --output json --output-file print)

WEATHER=$(echo "$INXI_OUT" | jq -r '.[]."000#1#0#Weather"[0]."002#0#2#conditions"')
TEMP=$(echo "$INXI_OUT" | jq -r '.[]."000#1#0#Weather"[0]."001#0#2#temperature"' | cut -d'.' -f1)
TEMP="${TEMP}°"

if [ -z "$TEMP" ]; then
  TEMP="--°"
fi

# check openweathermaps condition codes https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2

if [[ $WEATHER == *"thunderstorm"* ]]; then
  echo "storm $TEMP"
elif [[ $WEATHER == *"drizzle"* ]]; then
  echo "drzl $TEMP"
elif [[ $WEATHER == *"rain"* ]]; then
  echo "rain $TEMP"
elif [[ $WEATHER == *"snow"* ]]; then
  echo "snow $TEMP"
elif [[ $WEATHER == *"mist"* ]]; then
  echo "mist $TEMP"
elif [[ $WEATHER == *"smoke"* ]]; then
  echo "smoke $TEMP"
elif [[ $WEATHER == *"haze"* ]]; then
  echo "haze $TEMP"
elif [[ $WEATHER == *"fog"* ]]; then
  echo "fog $TEMP"
elif [[ $WEATHER == *"dust"* ]]; then
  echo "dust $TEMP"
elif [[ $WEATHER == *"squall"* ]]; then
  echo "wind $TEMP"
elif [[ $WEATHER == *"ash"* ]]; then
  echo "ash $TEMP"
elif [[ $WEATHER == *"tornado"* ]]; then
  echo "tndo $TEMP"
elif [[ $WEATHER == *"cloud"* ]]; then
  echo "cloud $TEMP"
elif [[ $WEATHER == *"clear"* ]]; then
  echo "clear $TEMP"
else
  echo "wthr $TEMP"
fi
