receiving
receive: aFrame
	
	self process: aFrame.
	self lastFlags: aFrame flags.
	self hadEndStream: (self lastFlags endStream or: self hadEndStream).
	(self hadEndStream and: self canEndStream) ifTrue: [
		self transition: H2NullReceiver.
		self stream deliverResponse.
		self stream closeStreamIfFinished ]