initializing
initializeHeaderStreamOut
	self headerStreamOut: 
		(ReadStream on: (self request header encode: self connection headerTableOut)).