#!/usr/bin/env bash

api_response=$(curl -s "https://open.er-api.com/v6/latest/USD")

echo $api_response

