instance creation
readFrameFrom: aStream sized: aLength
	^ self getFrameFrom:
		(aStream next: aLength + self headerLength) asByteArray