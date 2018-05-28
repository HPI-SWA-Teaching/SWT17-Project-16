decoding
nextParameterOn: aReadStream
	^ (self class intToSettingsCollection at: (aReadStream next: 2) asInteger)
		-> ((aReadStream next: 4) asInteger)
	
	