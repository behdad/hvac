#!/bin/bash

for FONT in hangul hanzi; do # Font
  for MIVS in quo float; do # MultiItemVariationStore storage
    for TVS in quo speed; do # TupleVariationStore storage
      for VARS in quo float; do # gvar / HVAC
	#for COMPS in quo array; do # VARC variation coords / axes
	file=font=$FONT,tvs=$TVS,mivs=$MIVS,vars=$VARS#,comps=$COMPS
	file=font=$FONT,tvs=$TVS,mivs=$MIVS,vars=$VARS
	ttf=$file.ttf
	woff2=$file.woff2
	export FONT=$FONT
	export TVS=$TVS
	export MIVS=$MIVS
	export VARS=$VARS
	#export COMPS=$COMPS

	# Generate the font
	echo Rendering $ttf
	~/hb/build/util/hb-view "$ttf" -u 6868,ac01
      done
    done
  done
done
