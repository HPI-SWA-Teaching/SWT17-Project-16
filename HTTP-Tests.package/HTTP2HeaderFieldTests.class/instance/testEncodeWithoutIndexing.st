testEncode
testEncodeWithoutIndexing
	| headerField indexTable |
	headerField := HTTP2HeaderFieldWithoutIndexing key: ':path' value: '/sample/path'.
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	self assert: (headerField encodeWithPayload: indexTable) 
		equals: self class pathSamplePathInByte.
	self assert: indexTable dynamicTable isEmpty.
	headerField := HTTP2HeaderFieldWithoutIndexing key: 'custom-key' value: 'custom-header'.
	self assert: (headerField encodeWithPayload: indexTable) 
		equals: #[16r00], self class customKeycustomHeaderInByte.
	self assert: indexTable dynamicTable isEmpty
