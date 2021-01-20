#!/bin/bash
for file in *.wav
do
    mv -i "${file}" "${file/711154/711501}"
done
