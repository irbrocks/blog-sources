#!/bin/bash
while read line; do
  if [[ "$line" =~ ^[0-9]+\ tests,\ [0-9]+\ assertions,\ 0\ failures,\ 0\ errors,\ 0\ skips$ ]]; then
    # It's ok!
    echo -e "\033[0;32m$line\033[0m"
  elif [[ "$line" =~ ^[0-9]+\ tests,\ [0-9]+\ assertions,\ 0\ failures,\ 0\ errors,\ [0-9]+\ skips$ ]]; then
    # Mmmm, there are some skips
    echo -e "\033[0;33m$line\033[0m"
  elif [[ "$line" =~ ^[0-9]+\ tests,\ [0-9]+\ assertions,\ [0-9]+\ failures,\ [0-9]+\ errors ]]; then
    # Bad, bad, bad...
    echo -e "\033[0;31m$line\033[0m"
  else
    echo "$line"
  fi
done < /dev/stdin
