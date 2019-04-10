decoding
nextParameterOn: aReadStream
	^ (self class intToSettingsCollection at: (aReadStream next: 2) asPositiveBigEndianInteger)
		-> ((aReadStream next: 4) asPositiveBigEndianInteger)
	
	