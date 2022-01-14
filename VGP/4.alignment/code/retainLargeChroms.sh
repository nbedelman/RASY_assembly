#!/bin/bash

inputFasta=$1
outputFasta=$2

bioawk -c fastx 'length($seq) > 38000000{ print ">"$name; print $seq }'  $inputFasta > $outputFasta
