testEncode
testEncodeString
	self assert: (H2HeaderField new encodeString: 'custom-key') 
		equals: self class customKeyinByte.
	self assert: (H2HeaderField new encodeString: 'custom-value') 
		equals: self class customValueInByte.