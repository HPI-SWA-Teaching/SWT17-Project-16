sending
sendLoop
	[self connectionActive] whileTrue:
		[self send.
		(Delay forMilliseconds: 1) wait]