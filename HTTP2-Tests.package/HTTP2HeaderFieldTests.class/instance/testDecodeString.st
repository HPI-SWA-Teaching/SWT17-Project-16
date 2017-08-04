testDecode
testDecodeString
	self assert:(H2HeaderField decodeString: 
		(ReadStream on:self class customKeyinByte)) equals:  'custom-key'.
	self assert:(H2HeaderField decodeString: 
		(ReadStream on:self class customValueInByte)) equals:  'custom-value'
