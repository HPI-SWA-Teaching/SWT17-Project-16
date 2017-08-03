decoding
nextParameterOn: aReadStream
	^ (self class intToSettingsCollection at: (self class byteArrayToInteger: (aReadStream next: 2)))
		->(self class byteArrayToInteger: (aReadStream next: 4))
	
	