receiving
receiveSettingsFrame: aFrame
	aFrame flags ack ifFalse: [
		self updateSettings: aFrame parameterList.
		self outQueue add: (H2SettingsFrame newAckFlagged)]