private
contentAsStream: contentBlock
	| helperStream |
	helperStream := ReadWriteStream on: ByteString new.
	contentBlock value: helperStream.
	^ helperStream
		reset;
		yourself.