encoding
encodeRemainingInteger: anInteger on: aByteStream
	(anInteger >= 128) ifTrue: [
		aByteStream nextPut: anInteger \\ 128 + 128.
		self encodeRemainingInteger: (anInteger >> 7) on: aByteStream]
	ifFalse: [ 
		aByteStream nextPut: anInteger]