instance creation
newWith: aStream
	^ self new;
		socketStream: aStream;
		initiateCommunication;
		yourself