#!/bin/bash

check_internet() {
  if ping -q -c 1 -W 1 google.com >/dev/null; then
    return 0
  else
    return 1
  fi
}

if check_internet; then
  # Make the API request and store the response
  response=$(curl -s "https://myrtle.jstet.net/")

  # Pipe the content into dinosay and apply lolcat
  echo "$response" | lolcat
else
  echo "No internet connection." | lolcat
fi
