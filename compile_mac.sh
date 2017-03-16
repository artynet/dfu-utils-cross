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

platform=$(o64-clang -v 2>&1 | grep Target | awk {'print $2'} | sed 's/[.].*//g')

mkdir -p distrib/osx
cd libusb-1.0.20
export LIBUSB_DIR=`pwd`
CC=o64-clang ./configure --host=$platform --enable-static --disable-shared
make clean
make
cd ..
cd dfu-util-dsigma
./autogen.sh
CC=o64-clang USB_CFLAGS="-I$LIBUSB_DIR/libusb/ -framework IOKit -framework CoreFoundation" USB_LIBS="-L$LIBUSB_DIR/libusb/.libs/ -lusb-1.0" ./configure --host=$platform
make clean
CFLAGS=-static make
cp src/dfu-suffix src/dfu-prefix src/dfu-util ../distrib/osx/
mv ../distrib/osx/dfu-util ../distrib/osx/dfu-util-bin
cp ../launchers/dfu-util-unix ../distrib/osx/dfu-util
chmod +x ../distrib/osx/dfu-util
#cd libusb-1.0.9 && make distclean && cd..
#cd dfu-util-0.8 && make distclean && cd..
