as yet unclassified
decodeParameterList
	| readStream |
	self parameterList: OrderedCollection new.
	readStream := ReadStream on: self payload.
	[readStream atEnd] whileFalse: [
		self parameterList add:
			(HTTP2SettingsFrame intToSettingsCollection at: (readStream next: 2) asInteger)
			->(readStream next: 4) asInteger
	]
	