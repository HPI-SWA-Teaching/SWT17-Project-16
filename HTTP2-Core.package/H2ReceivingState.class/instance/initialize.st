initialize-release
initialize
	
	self lastFlags: (H2FrameFlags newFrom: 0).
	self hadEndStream: false