requesting
openStreamFor: aRequest
	self connectionActive ifTrue: [
		^ self openStreamForActiveConnection: aRequest]
	ifFalse: [HTTP2Error signal: 'The connection is closed']