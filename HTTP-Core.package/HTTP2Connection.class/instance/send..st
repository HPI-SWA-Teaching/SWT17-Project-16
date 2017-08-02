sending
send: aByteArray
	self updateWindowSize: (aByteArray size - 9) negated.
	self socketStream nextPutAll: aByteArray; flush.