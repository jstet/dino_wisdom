#!/bin/bash

# Function to check internet connectivity
check_internet() {
  if ping -q -c 1 -W 1 google.com >/dev/null; then
    return 0
  else
    return 1
  fi
}

# Check internet connectivity
if check_internet; then
  # Make the API request and store the response
  response=$(curl -s "https://api.quotable.io/quotes/random")

  # Extract the content from the response using a JSON parsing tool like 'jq'
  content=$(echo "$response" | jq -r '.[0].content')

  # Pipe the content into dinosay and apply lolcat
  dinosay -d brachio "$content"| lolcat
else
  echo "No internet connection."
fi
