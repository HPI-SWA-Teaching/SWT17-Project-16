initializing
initialize
	self headerTableIn: (HTTP2HPACKIndexTable newWith: 4096).
	self headerTableOut: (HTTP2HPACKIndexTable newWith: 4096).
	self activeStreams: Dictionary new.
	self nextFreeStreamId: 3.
	self initialWindowSize: (2 raisedTo: 16)-1.
	self maxConcurrentStreams: (2 raisedTo: 32) - 1.
	self maxFrameSize: (2 raisedTo: 14).
	self flowControlWindow: self initialWindowSize.
	self headerLock: 0