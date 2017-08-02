connecting
initiateCommunication
	self controlStream: (HTTP2ControlStream newFor: self).
	self sendConnectionPreface.
	self connectionActive: true.
	[self sendLoop] fork.
	[self receiveLoop] fork.