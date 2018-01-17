#!/bin/bash

. /home/hadaq/trbsoft/trb3/trb3login
cd /home/hadaq/trbsoft/daqtools/users/gsi_ee_trb84/asd8_teststand

export DAQOPSERVER=localhost:84
tdc=0x1130
# set data limit
trbcmd w $tdc 0xc804 100
# set trigger windows -400 + 100
# trbcmd w $tdc 0xc801 0x80140050 

# set trigger windows -1000 + 100
trbcmd w $tdc 0xc801 0x801400c8

# set trigger windows -1000 + 1000
trbcmd w $tdc 0xc801 0x80c800c8

# enable relevant TDC channels
trbcmd w $tdc 0xc802 0x00ffffffff
#trbcmd w 0x1482 0xc802 0x00000000



rm Go4AutoSave.root
go4 my_hotstart.hotstart
