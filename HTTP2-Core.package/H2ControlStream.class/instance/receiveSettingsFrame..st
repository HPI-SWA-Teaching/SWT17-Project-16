receiving
receiveSettingsFrame: aFrame
	aFrame hasAckFlag ifFalse: [
		self updateSettings: aFrame parameterList.
		self outQueue add:
			(H2SettingsFrame new
				setAckFlag: true;
				yourself)]