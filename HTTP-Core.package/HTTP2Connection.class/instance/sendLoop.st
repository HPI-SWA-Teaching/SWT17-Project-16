sending
sendLoop
	[self connectionActive] whileTrue:
		[self send.
		(Delay forMilliseconds: self class standardWaitingTime) wait]