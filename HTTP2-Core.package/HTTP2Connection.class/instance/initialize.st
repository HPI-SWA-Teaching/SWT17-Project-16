initializing
initialize
	self headerTableIn: 
		(HTTP2HPACKIndexTable newWith: HTTP2HPACKIndexTable standardSize).
	self headerTableOut: 
		(HTTP2HPACKIndexTable newWith: HTTP2HPACKIndexTable standardSize).
	self activeStreams: Dictionary new.
	self nextFreeStreamId: self class firstFreeSteam.
	self initialWindowSize: self class standardWindowSize.
	self maxConcurrentStreams: self class standardMaxConcurrentStreams.
	self maxFrameSize: HTTP2Frame standardSize.
	self flowControlWindow: self initialWindowSize.
	self headerLock: 0