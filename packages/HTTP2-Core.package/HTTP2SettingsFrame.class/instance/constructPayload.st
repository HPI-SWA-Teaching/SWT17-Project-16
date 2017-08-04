encoding
constructPayload 
	| payload |
	payload := #[].
	self parameterList do: [:association | payload := payload, 
		(self integer: (self class settingsToIntDictionary at: association key) asByteArrayOfSize: 2),
		(self integer: (association value) asByteArrayOfSize: 4)].
	^ payload 