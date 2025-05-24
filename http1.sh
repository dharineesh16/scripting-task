#!/bin/bash

curl https://guvi.in

url="https://guvi.in"
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

echo "HTTP Status Code for $url: $response"

if [[ $response =~ ^2 ]]; then
    echo "Success: The request was successful."
elif [[ $response =~ ^4 ]]; then
    echo "Failure: Client error occurred."
elif [[ $response =~ ^5 ]]; then
    echo "Failure: Server error occurred."
else
    echo "Failure: Unexpected status code received."
fi
