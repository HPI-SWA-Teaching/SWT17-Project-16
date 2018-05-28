receiving
receivePingFrame: aFrame
	aFrame setAckFlag: true.
	self outQueue add: aFrame