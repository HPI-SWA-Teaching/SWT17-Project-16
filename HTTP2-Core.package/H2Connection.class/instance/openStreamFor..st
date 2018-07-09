requesting
openStreamFor: aRequest
	self connectionActive ifFalse: [H2Error signal: 'The connection is closed'].
	
	^ self openStreamForActiveConnection: aRequest