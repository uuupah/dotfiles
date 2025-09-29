#! /bin/bash
while true
do
	INXI_OUT=$(inxi -w --output json --output-file print)

	WEATHER=$(echo "$INXI_OUT" | jq -r '.[]."000#1#0#Weather"[0]."002#0#2#conditions"')
	TEMP=$(echo "$INXI_OUT" | jq -r '.[]."000#1#0#Weather"[0]."001#0#2#temperature"' | cut -d'.' -f1)
	TEMP="${TEMP}°"

	if [ -z "$TEMP" ]; then
	  TEMP="--°"
	fi

	# check openweathermaps condition codes https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2

	if [[ $WEATHER == *"thunderstorm"* ]]; then
	  echo "storm $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"drizzle"* ]]; then
	  echo "drzl $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"rain"* ]]; then
	  echo "rain $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"snow"* ]]; then
	  echo "snow $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"mist"* ]]; then
	  echo "mist $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"smoke"* ]]; then
	  echo "smoke $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"haze"* ]]; then
	  echo "haze $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"fog"* ]]; then
	  echo "fog $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"dust"* ]]; then
	  echo "dust $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"squall"* ]]; then
	  echo "wind $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"ash"* ]]; then
	  echo "ash $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"tornado"* ]]; then
	  echo "tndo $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"cloud"* ]]; then
	  echo "cloud $TEMP" > /tmp/weather
	elif [[ $WEATHER == *"clear"* ]]; then
	  echo "clear $TEMP" > /tmp/weather
	else
	  echo "wthr $TEMP" > /tmp/weather
	fi
	sleep 900
done
