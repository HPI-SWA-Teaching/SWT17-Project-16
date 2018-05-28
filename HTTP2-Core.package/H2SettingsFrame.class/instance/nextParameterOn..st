decoding
nextParameterOn: aReadStream
	^ (self class intToSettingsCollection at: (Integer from: (aReadStream next: 2)))
		->(Integer from: (aReadStream next: 4))
	
	