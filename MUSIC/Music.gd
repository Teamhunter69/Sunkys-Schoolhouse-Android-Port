extends Node

var playa = false

func playo():
	if playa == false:
		$MUS1.play()
		$MUS2.play()
		$MUS3.play()
		$MUS4.play()
		$MUS5.play()
		$MUS6.play()
		$MUSB.play()
		playa = true

func play0():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -80
	$MUS3.volume_db = -80
	$MUS4.volume_db = -80
	$MUS5.volume_db = -80
	$MUS6.volume_db = -80
	$MUSB.volume_db = -80

func play1():
	$MUS1.volume_db = -15
	$MUS2.volume_db = -80
	$MUS3.volume_db = -80
	$MUS4.volume_db = -80
	$MUS5.volume_db = -80
	$MUS6.volume_db = -80
	$MUSB.volume_db = -80

func play2():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -15
	$MUS3.volume_db = -80
	$MUS4.volume_db = -80
	$MUS5.volume_db = -80
	$MUS6.volume_db = -80
	$MUSB.volume_db = -80

func play3():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -80
	$MUS3.volume_db = -15
	$MUS4.volume_db = -80
	$MUS5.volume_db = -80
	$MUS6.volume_db = -80
	$MUSB.volume_db = -80

func play4():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -80
	$MUS3.volume_db = -80
	$MUS4.volume_db = -20
	$MUS5.volume_db = -80
	$MUS6.volume_db = -80
	$MUSB.volume_db = -80

func play5():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -80
	$MUS3.volume_db = -80
	$MUS4.volume_db = -80
	$MUS5.volume_db = -20
	$MUS6.volume_db = -80
	$MUSB.volume_db = -80

func play6():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -80
	$MUS3.volume_db = -80
	$MUS4.volume_db = -80
	$MUS5.volume_db = -80
	$MUS6.volume_db = -20
	$MUSB.volume_db = -80

func play6B():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -80
	$MUS3.volume_db = -80
	$MUS4.volume_db = -80
	$MUS5.volume_db = -80
	$MUS6.volume_db = -30
	$MUSB.volume_db = -80

func playB():
	$MUS1.volume_db = -80
	$MUS2.volume_db = -80
	$MUS3.volume_db = -80
	$MUS4.volume_db = -80
	$MUS5.volume_db = -80
	$MUS6.volume_db = -80
	$MUSB.volume_db = -10
