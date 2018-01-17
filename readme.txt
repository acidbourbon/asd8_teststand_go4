how to start the ASD8 test go4 application:

-1. connect DBO to trb3-adapter , connect input pulse
	pulse generator settings: 	ch1 (DBO test signal):  pulse, 5 kHz, amplitude 250 mV, offset 0V, width 53 ns, leading = trailing = 2.5ns
					ch2 (trigger signal):  pulse, 5 kHz, amplitude 2.5 V, offset 0V, width 0.2, leading = trailing = 2.5ns

0. prepare environment:
  . ~/trbsoft/trb3/trb3login
and initalize trb:
	hadaq@hades39:~/trbsoft/daqtools/users/gsi_ee_trb84
	$
	$ ./startup.sh


1. get dabc running, need connection on port 6789
	> hadaq@hades39:~/trbsoft/daqtools/users/gsi_ee_trb84:  dabc_exe TdcEventBuilder.xml 

start cts webserver:
	> cd hadaq@hades39:~/trbsoft/daqtools/web/
	> export DAQOPSERVER=localhost:84  
	> tmux new-session -s webserver ". $HOME/.zshrc; cd ~/trbsoft/daqtools/web; ./cts_gui --port 1234 --noopenxterm --endpoint 0xc001; sleep 10" 

	http://localhost:1234/tdc/tdc.htm
	for TDC 1130:
	enable data outputs 1-32 
	enable trigger windows +-500 ns
        http://hades39:1234/cts/cts.htm   at CTS select trigger source "AddOn Multiplexer 0" (is connected to TTL output of 
pulser)

2. thresholds: 
	open a screen, tmux or dedicated terminal and execute the following command:
	while true; do ./set_asd8_thresh.sh 32000; sleep 2; done 
	(runs in a loop, continuously sets ASD8 thresholds)
	already started in : screen -x asd8_thresh

3. start go4 to see results:
	 ./start.sh
	in the tree browser on the left open Analysis/Histograms/Sec_1130/Sec_1130_efficiency
	enjoy the histogram: ch0 is trigger channel (not shown) channel 1 in plot equals first input channel on ASD8 board.

	ch 1-8   : ASD8 #1 on upper board
	ch 9-16  : ASD8 #1 on lower board
	ch 17-24 : ASD8 #2 on upper board
	ch 25-32 : ASD8 #2 on lower board
