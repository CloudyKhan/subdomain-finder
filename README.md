# Subdomain Finder

This Bash script uses `assetfinder` to gather subdomains for a given domain and then filters the results to only include subdomains belonging to the target domain. It is a useful tool for initial reconnaissance during penetration testing or OSINT activities.

## Features

- Automatically creates necessary directories to organize results
- Gathers subdomains related to a given domain using `assetfinder`
- Filters out-of-scope results to keep only the subdomains that belong to the target domain
- Provides a final count of found subdomains

## Prereqs

Make sure you have Go installed and have `assetfinder` installed via Go. You can install it using the following command:

```bash
go install github.com/tomnomnom/assetfinder@latest
```

## Installation
1. Clone the repository or download the script
   
```bash
git clone https://github.com/CloudyKhan/subdomain-finder.git
```
2. Navigate to the folder with the script

```bash
cd subdomain-finder
```

3. Make it executable

```bash
chmod +x subdomain-finder.sh
```

## Usage

Run the script by providing the domain you want to enumerate subdomains for:

```bash
./subdomain-finder.sh <domain>
```

The script will do the following:

    Create a directory for the domain.
    Use assetfinder to gather subdomains related to the domain.
    Filter the results to ensure only in-scope subdomains (those directly under the target domain) are included.
    Output the total number of subdomains found and save the results in a file called final.txt.
    
## Output
The filtered list of subdomains will be saved in:
```bash
<domain>/recon/final.txt
```
