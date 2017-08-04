sending
satisfyHeaderLock
	| stream |
	stream := self activeStreams at: self headerLock.
	stream isAbleToSend ifTrue:
		[self send: (stream nextFrame: self flowControlWindow)]