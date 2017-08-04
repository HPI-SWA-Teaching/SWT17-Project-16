initializing
initialize
	self headerTableIn: H2HPACKIndexTable new.
	self headerTableOut: H2HPACKIndexTable new.
	self activeStreams: Dictionary new.
	self nextFreeStreamId: self class firstFreeSteam.
	self initialWindowSize: self class standardWindowSize.
	self maxConcurrentStreams: self class standardMaxConcurrentStreams.
	self maxFrameSize: H2Frame standardSize.
	self flowControlWindow: self initialWindowSize.
	self headerLock: 0