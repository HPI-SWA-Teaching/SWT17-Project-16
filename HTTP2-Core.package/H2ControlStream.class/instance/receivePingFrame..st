receiving
receivePingFrame: aFrame
	aFrame flags ack: true.
	self outQueue add: aFrame