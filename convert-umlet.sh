#!/usr/bin/env bash
# Example usage: convert-umlet.sh sequence

cd umlet_source
java -jar /Users/myers/Downloads/Umlet/umlet.jar -action=convert -format=pdf -filename=$1.uxf
mv $1.pdf ../uml/$1.pdf
