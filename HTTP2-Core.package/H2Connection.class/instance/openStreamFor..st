requesting
openStreamFor: aRequest
	self connectionActive ifTrue: [
		^ self openStreamForActiveConnection: aRequest]
	ifFalse: [H2Error signal: 'The connection is closed']