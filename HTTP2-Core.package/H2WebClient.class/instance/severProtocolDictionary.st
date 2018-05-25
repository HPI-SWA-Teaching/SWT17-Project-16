accessing
severProtocolDictionary

	severProtocolDictionary ifNil: [
		severProtocolDictionary := Dictionary new.	].
	^ severProtocolDictionary
