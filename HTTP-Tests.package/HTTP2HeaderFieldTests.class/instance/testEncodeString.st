testEncode
testEncodeString
	self assert: (HTTP2HeaderField new encodeString: 'custom-key') 
		equals: self class customKeyinByte.
	self assert: (HTTP2HeaderField new encodeString: 'custom-value') 
		equals: self class customValueInByte.