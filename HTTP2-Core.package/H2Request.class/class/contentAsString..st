as yet unclassified
contentAsString: contentBlock
	| helperStream |
	helperStream := ReadWriteStream on: ByteString new.
	contentBlock value: helperStream.
	^ helperStream
		reset;
		upToEnd.