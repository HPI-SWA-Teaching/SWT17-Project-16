accessing
serverProtocolDictionary

	serverProtocolDictionary ifNil: [ serverProtocolDictionary := Dictionary new].
	^ serverProtocolDictionary
