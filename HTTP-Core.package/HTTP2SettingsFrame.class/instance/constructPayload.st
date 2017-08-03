as yet unclassified
constructPayload 
	| payload |
	payload := #[].
	self parameterList do: [:association | payload := payload, 
		(self integer: (HTTP2SettingsFrame settingsToIntDictionary at: association key) asByteArrayOfSize: 2),
		(self integer: (association value) asByteArrayOfSize: 4)].
	^ payload 