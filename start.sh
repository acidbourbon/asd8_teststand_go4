#!/bin/bash

. /home/hadaq/trbsoft/trb3/trb3login
cd /home/hadaq/trbsoft/daqtools/users/gsi_ee_trb84/asd8_teststand
rm Go4AutoSave.root
go4 my_hotstart.hotstart
