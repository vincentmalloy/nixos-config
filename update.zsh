#!/usr/bin/env zsh

nix-prefetch-git --url git@github.com:4b85151d28b3025451f5634b6081019d > tmp-omp-json
url=$(cat ./tmp-omp-json | jq .url)
rev=$(cat ./tmp-omp-json | jq .rev)
sha256=$(cat ./tmp-omp-json | jq .sha256)
cat <<eos > users/simon/fetch-omp-config.nix
{
  url = $url;
  rev = $rev;
  sha256 = $sha256;
}
eos
rm tmp-omp-json
