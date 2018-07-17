receiving
process: aFrame
	
	self stream headerStreamIn nextPutAll: aFrame payload.
	aFrame flags endHeaders ifTrue: [
		self stream pushPromiseCompleted: self promisedStreamID.
		self transition: self reentryState ]