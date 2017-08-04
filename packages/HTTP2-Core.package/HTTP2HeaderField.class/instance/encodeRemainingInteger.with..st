encoding
encodeRemainingInteger: anInteger with: prefix
	| stream |
	stream := WriteStream on: ByteArray new.
	stream nextPut: prefix.
	self encodeRemainingInteger: anInteger - prefix 
			on: stream.
	^ stream contents 