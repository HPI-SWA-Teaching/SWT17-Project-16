instance creation
newFor: aHTTP2Stream from: aReceivingState
	^ (super newFor: aHTTP2Stream from: aReceivingState)
		reentryState: aReceivingState class;
		yourself
		