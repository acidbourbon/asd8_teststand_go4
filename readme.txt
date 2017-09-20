how to start the ASD8 test go4 application:


get dabc running, need connection on port 6789


for TDC 1130:
	enable data outputs 1-32 

	enable trigger windows +-500 ns

at CTS select trigger source "AddOn Multiplexer 0" (is connected to TTL output of pulser)


open a screen, tmux or dedicated terminal and execute the following command:
while true; do ./set_asd8_thresh.sh 25000; sleep 2; done 
(runs in a loop, continuously sets ASD8 thresholds)


finally run ./start.sh

in the tree browser on the left open Analysis/Histograms/Sec_1130/Sec_1130_efficiency

enjoy the histogram: ch0 is trigger channel (not shown) channel 1 in plot equals first input channel on ASD8 board.

ch 1-8   : ASD8 #1 on upper board
ch 9-16  : ASD8 #1 on lower board
ch 17-24 : ASD8 #2 on upper board
ch 25-32 : ASD8 #2 on lower board
