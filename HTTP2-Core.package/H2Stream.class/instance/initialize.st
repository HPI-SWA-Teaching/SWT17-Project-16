initializing
initialize
	self sender: (H2HeadersFrameSender newFor: self).
	self byteStreamIn: (WriteStream on: ByteArray new).
	self receiver: (H2HeadersFrameReceiver newFor: self).
	self promise: Promise new