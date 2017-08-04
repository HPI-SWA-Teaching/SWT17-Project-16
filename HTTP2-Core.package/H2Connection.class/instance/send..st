sending
send: aByteArray
	self updateWindowSize: (aByteArray size - H2Frame headerLength) negated.
	self socketStream nextPutAll: aByteArray; flush.