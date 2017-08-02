receiving
receiveSettingsFrame: aFrame
	aFrame flagAck = 0 ifTrue: [
	self updateSettings: aFrame parameterList.
	self outQueue add:
		(HTTP2SettingsFrame new
			flagAck: 1;
			yourself)]