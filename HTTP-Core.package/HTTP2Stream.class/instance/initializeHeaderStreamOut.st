as yet unclassified
initializeHeaderStreamOut
	self headerStreamOut: (ReadStream on: (self request header encode: self streamManager headerTableOut)).