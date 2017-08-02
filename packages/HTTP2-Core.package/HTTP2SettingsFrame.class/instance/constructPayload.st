as yet unclassified
constructPayload 
	| payload |
	payload := #[].
	self parameterList do: [:association | payload := payload, 
		((HTTP2SettingsFrame settingsToIntDictionary at: association key) asByteArrayOfSize: 2),
		((association value) asByteArrayOfSize: 4)].
	^ payload 