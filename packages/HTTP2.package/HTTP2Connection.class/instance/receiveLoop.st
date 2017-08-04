receiving
receiveLoop
	[self connectionActive and: [self socketStream atEnd not]] whileTrue: [
		self receive.
		(Delay forMilliseconds: self class standardWaitingTime) wait]