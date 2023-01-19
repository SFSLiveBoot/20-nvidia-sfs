#!/bin/sh

# Connect all monitors from other providers to the first output source
for provider in $(xrandr --listproviders  | grep -Eo "^Provider [1-9]+" | cut -f2 -d" ");do
  xrandr --setprovideroutputsource "$provider" 0
done
