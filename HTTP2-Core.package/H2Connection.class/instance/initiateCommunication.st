connecting
initiateCommunication
	self controlStream: (H2ControlStream newFor: self).
	self sendConnectionPreface.
	self connectionActive: true.
	[self sendLoop] fork.
	[self receiveLoop] fork