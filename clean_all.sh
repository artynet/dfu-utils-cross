#!/bin/bash

list="dfu-util-0.9 libusb-1.0.21 dfu-util-official"

for i in $list
do
    cd $i
    make distclean
    cd ..
done

git clean -f -d
git checkout libusb*/
