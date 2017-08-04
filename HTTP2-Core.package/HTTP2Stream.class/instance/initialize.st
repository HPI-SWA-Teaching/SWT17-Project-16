initializing
initialize
	self sender: (HTTP2HeaderFrameSender newFor: self).
	self byteStreamIn: (WriteStream on: ByteArray new).
	self receiver: (HTTP2HeaderFrameReceiver newFor: self).
	self promise: Promise new