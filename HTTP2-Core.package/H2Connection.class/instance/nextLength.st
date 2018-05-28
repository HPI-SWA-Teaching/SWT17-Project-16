receiving
nextLength
	^ (self socketStream peek: 3) asByteArray asInteger