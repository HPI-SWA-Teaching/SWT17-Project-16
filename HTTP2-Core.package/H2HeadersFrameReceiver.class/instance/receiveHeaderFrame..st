receiving
receiveHeaderFrame: aFrame
	self stream byteStreamIn nextPutAll: aFrame payload.
	self transition.
	aFrame flagEndStream = 1 ifTrue: [
		self stream receiver nextState: H2NullReceiver].
	aFrame flagEndHeaders = 1 ifTrue: [
		self stream receiver transition]