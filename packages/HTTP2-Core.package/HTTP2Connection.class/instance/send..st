sending
send: aByteArray
	self updateWindowSize: (aByteArray size - HTTP2Frame headerLength) negated.
	self socketStream nextPutAll: aByteArray; flush.