#!/usr/bin/env zsh

url="https://gist.githubusercontent.com/vincentmalloy/4b85151d28b3025451f5634b6081019d/raw/config.json"
hash=$(nix-prefetch-url "$url")
# url=$(cat ./tmp-omp-json | jq .url)
# rev=$(cat ./tmp-omp-json | jq .rev)
# sha256=$(cat ./tmp-omp-json | jq .sha256)
cat <<eos > users/default/fetch-omp-config.nix
{
  url = "$url";
  sha256 = "$hash";
}
eos
