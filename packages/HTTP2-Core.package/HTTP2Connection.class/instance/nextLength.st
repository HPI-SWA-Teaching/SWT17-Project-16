receiving
nextLength
	^ self byteArrayToInteger: (self socketStream peek: 3) asByteArray