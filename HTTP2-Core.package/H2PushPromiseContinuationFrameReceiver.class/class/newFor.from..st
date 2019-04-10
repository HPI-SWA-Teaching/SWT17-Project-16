instance creation
newFor: aHTTP2Stream from: aPushPromiseReceiver
	^ (super newFor: aHTTP2Stream from: aPushPromiseReceiver)
		reentryState: aPushPromiseReceiver reentryState;
		promisedStreamID: aPushPromiseReceiver promisedStreamID;
		yourself
		