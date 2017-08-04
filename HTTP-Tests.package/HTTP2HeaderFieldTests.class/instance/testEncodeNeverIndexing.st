testEncode
testEncodeNeverIndexing
	| headerField indexTable |
	headerField := HTTP2HeaderFieldNeverIndexing key: 'password' value: 'secret'.
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	self assert: (headerField encodeWithPayload: indexTable) 
		equals: self class passwordSecretInByte.
	self assert: indexTable dynamicTable isEmpty.
	headerField := HTTP2HeaderFieldNeverIndexing key: 'custom-key' value: 'custom-header'.
	self assert: (headerField encodeWithPayload: indexTable) 
		equals: (#[16r10], self class customKeyinByte), self class customHeaderInByte,# [16r72]. 
	self assert: indexTable dynamicTable isEmpty
