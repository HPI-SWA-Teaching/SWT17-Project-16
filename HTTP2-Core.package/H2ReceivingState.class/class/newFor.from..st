instance creation
newFor: aHTTP2Stream from: aReceivingState
	^ self new
		stream: aHTTP2Stream;
		lastFlags: aReceivingState lastFlags;
		hadEndStream: aReceivingState hadEndStream;
		yourself