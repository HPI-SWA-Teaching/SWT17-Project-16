receiving
receiveHeaderFrame: aFrame

	self transition: H2TrailerHeaderFrameReceiver.
	self stream receiver receive: aFrame