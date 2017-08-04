receiving
receiveSettingsFrame: aFrame
	aFrame flagAck = 0 ifTrue: [
		self updateSettings: aFrame parameterList.
		self outQueue add:
			(H2SettingsFrame new
				flagAck: 1;
				yourself)]