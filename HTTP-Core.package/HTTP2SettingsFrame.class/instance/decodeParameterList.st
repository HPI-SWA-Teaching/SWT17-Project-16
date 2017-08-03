as yet unclassified
decodeParameterList
	| readStream |
	self parameterList: OrderedCollection new.
	readStream := ReadStream on: self payload.
	[readStream atEnd] whileFalse: [
		self parameterList add:
			(HTTP2SettingsFrame intToSettingsCollection at: (self class byteArrayToInteger: (readStream next: 2)))
			->(readStream next: 4) asInteger
	]
	