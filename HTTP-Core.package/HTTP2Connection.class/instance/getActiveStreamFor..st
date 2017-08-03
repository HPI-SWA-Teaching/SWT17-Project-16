receiving
getActiveStreamFor: aFrame
	^ self activeStreams at: aFrame streamIdentifier 
		ifAbsent: [self receiveOnNonActiveStream: aFrame]