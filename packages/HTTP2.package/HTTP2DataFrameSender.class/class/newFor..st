instance creation
newFor: aStream
	| frameSender |
	frameSender := (super newFor: aStream).
	frameSender stream byteStreamOut: (ReadStream on: frameSender stream request data asByteArray).
	^ frameSender