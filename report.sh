#!/bin/bash

grep median *.csv |
sed 's@.*BM_Font/draw_glyph/@@; s@/hb_median",15,[0-9.]*,@ @; s/,us.*//; s/[.][0-9]*$//' |
while read font time; do
  stem=$(basename $font .ttf)
  ttf_size=$(stat -c %s $font)
  woff2_size=$(stat -c %s $stem.woff2)
  echo $stem $ttf_size $woff2_size $time
done
