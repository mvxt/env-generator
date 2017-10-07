#!/bin/bash

FILES=$(pwd)/.*

for f in $FILES; do
	echo "Creating symbolic link for $f..."
	ln -s $f ~/$(basename $f)
done
