instance creation
newFor: aHTTP2Stream
	^ self new
		stream: aHTTP2Stream;
		yourself