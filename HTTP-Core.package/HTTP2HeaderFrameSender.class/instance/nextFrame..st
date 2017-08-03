sending
nextFrame: maxPayloadSize
	self stream byteStreamOut: (ReadStream on: (self stream request header encode: self stream connection headerTableOut)).
	^ super nextFrame: maxPayloadSize