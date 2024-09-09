#!/bin/bash

# First, make sure the user provides a domain name to search for
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

# The first argument (the domain) will be stored in the 'url' variable
url=$1

# Check if there's a folder with the domain name. If not, we will create it
if [ ! -d "$url" ]; then
  echo "[+] Creating a directory for the domain: $url"
  mkdir -p $url/recon
fi

# Make sure we have a 'recon' folder inside the domain folder
if [ ! -d "$url/recon" ]; then
  echo "[+] Creating a recon folder to store results..."
  mkdir -p $url/recon
fi

# Use assetfinder to look for all subdomains related to the domain
echo "[+] Looking for subdomains related to $url using assetfinder..."
assetfinder $url > "$url/recon/assets.txt"

# After gathering subdomains, we will filter them to only keep those that actually belong to the target domain to remain in scope
# Essential to ensure we stay focused on the target
echo "[+] Filtering the subdomains to ensure they belong to the target domain..."
cat "$url/recon/assets.txt" | grep "\.$url$" > "$url/recon/final.txt"

# Since we now have the filtered subdomains - no longer need the raw assetfinder results, so let's clean it up
rm "$url/recon/assets.txt"

# Count how many subdomains we found
subdomain_count=$(wc -l < "$url/recon/final.txt")
echo "[+] Done! Found $subdomain_count subdomains for $url. Stored in $url/recon/final.txt."
