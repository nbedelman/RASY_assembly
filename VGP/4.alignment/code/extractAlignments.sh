#!/bin/bash

deltaPrefix=$1

grep -v \# $deltaPrefix.fplot | sed 's/^$/NA NA 0/' > $deltaPrefix.ali.fplot
grep -v \# $deltaPrefix.rplot | sed 's/^$/NA NA 0/' > $deltaPrefix.ali.rplot
