decoding
decodeParameterList
	| readStream |
	self parameterList: OrderedCollection new.
	readStream := ReadStream on: self payload.
	[readStream atEnd] whileFalse: [
		self parameterList add: (self nextParameterOn: readStream)]
	