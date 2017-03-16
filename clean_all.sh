#!/bin/bash

for i in dfu-util-0.8 dfu-util-0.9 dfu-util-dsigma libusb-1.0.20
do
    cd $i
    make distclean
    cd ../
done
