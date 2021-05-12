#!/bin/bash -xe
# Copyright (c) 2016 Arduino LLC
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

mkdir -p distrib-arancino/linux64
cd libusb-1.0.23
export LIBUSB_DIR=`pwd`
CFLAGS="-lrt" ./configure --enable-static --disable-shared --disable-udev --host=x86_64-ubuntu16.04-linux-gnu
make clean
make
cd ..
cd dfu-util-0.10
CFLAGS="-lrt" USB_CFLAGS="-I$LIBUSB_DIR/libusb/" USB_LIBS="-L$LIBUSB_DIR/libusb/.libs/ -lusb-1.0 -lpthread" ./configure --host=x86_64-ubuntu16.04-linux-gnu
make clean
CFLAGS=-static make
cp src/dfu-suffix src/dfu-prefix src/dfu-util  ../distrib-arancino/linux64/
cd ..

mkdir -p distrib-arancino/linux32
cd libusb-1.0.23
export LIBUSB_DIR=`pwd`
CFLAGS="-lrt" ./configure  --enable-static --disable-shared --disable-udev --host=i686-ubuntu16.04-linux-gnu
make clean
make
cd ..
cd dfu-util-0.10
CFLAGS="-lrt" USB_CFLAGS="-I$LIBUSB_DIR/libusb/" USB_LIBS="-L$LIBUSB_DIR/libusb/.libs/ -lusb-1.0 -lpthread" ./configure --host=i686-ubuntu16.04-linux-gnu
make clean
CFLAGS=-static make
cp src/dfu-suffix src/dfu-prefix src/dfu-util ../distrib-arancino/linux32
cd ..

mkdir -p distrib-arancino/arm
cd libusb-1.0.23
export LIBUSB_DIR=`pwd`
./configure --enable-static --disable-shared --disable-udev --host=arm-linux-gnueabihf
make clean
make
cd ..
cd dfu-util-0.10
USB_CFLAGS="-I$LIBUSB_DIR/libusb/" USB_LIBS="-L$LIBUSB_DIR/libusb/.libs/ -lusb-1.0 -lpthread" ./configure --host=arm-linux-gnueabihf
make clean
CFLAGS=-static make
cp src/dfu-suffix src/dfu-prefix src/dfu-util ../distrib-arancino/arm/
cd ..

mkdir -p distrib-arancino/arm64
cd libusb-1.0.23
export LIBUSB_DIR=`pwd`
./configure --enable-static --disable-shared --disable-udev --host=aarch64-linux-gnu
make clean
make
cd ..
cd dfu-util-0.10
USB_CFLAGS="-I$LIBUSB_DIR/libusb/" USB_LIBS="-L$LIBUSB_DIR/libusb/.libs/ -lusb-1.0 -lpthread" ./configure --host=aarch64-linux-gnu
make clean
CFLAGS=-static make
cp src/dfu-suffix src/dfu-prefix src/dfu-util ../distrib-arancino/arm64/
cd ..
