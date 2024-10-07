#!/bin/bash

for FONT in hangul hanzi; do # Font
  for MIVS in quo float; do # MultiItemVariationStore storage
    for TVS in quo speed; do # TupleVariationStore storage
      for VARS in quo float; do # gvar / HVAC
	#for COMPS in quo array; do # VARC variation coords / axes
	file=font=$FONT,tvs=$TVS,mivs=$MIVS,vars=$VARS#,comps=$COMPS
	file=font=$FONT,tvs=$TVS,mivs=$MIVS,vars=$VARS
	ttf=$file.ttf
	csv=$file.csv
	export FONT=$FONT
	export TVS=$TVS
	export MIVS=$MIVS
	export VARS=$VARS
	#export COMPS=$COMPS

	# Benchmark the font
	echo Benchmarking $ttf
	~/hb/build/perf/benchmark-font \
		--benchmark_filter=draw_.*ttf/hb \
		--benchmark_out="$csv" \
		--benchmark_out_format=csv \
		--benchmark_repetitions=15 \
		--benchmark_report_aggregates_only=true \
		--benchmark_min_time=0.1 \
		--benchmark_max_time=10 \
		"$ttf"
      done
    done
  done
done
