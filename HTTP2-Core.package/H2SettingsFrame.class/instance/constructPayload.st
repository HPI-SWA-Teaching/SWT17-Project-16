encoding
constructPayload 
	| payload |
	payload := #[].
	self parameterList do: [:association | payload := payload, 
		((self class settingsToIntDictionary at: association key) asByteArrayOfSize: 2),
		((association value) asByteArrayOfSize: 4)].
	^ payload 