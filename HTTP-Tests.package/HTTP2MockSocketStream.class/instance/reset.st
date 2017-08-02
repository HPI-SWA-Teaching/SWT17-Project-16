accessing
reset
	self inStream: OrderedCollection new.
	self outStream: (ReadWriteStream on: ByteArray new).