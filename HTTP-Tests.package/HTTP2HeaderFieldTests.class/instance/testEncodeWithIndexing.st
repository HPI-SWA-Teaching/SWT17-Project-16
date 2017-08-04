testEncode
testEncodeWithIndexing
	| headerField indexTable |
	headerField := HTTP2HeaderFieldWithIndexing key: 'custom-key' value: 'custom-header'.
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	self assert: (headerField encodeWithPayload: indexTable) 
		equals: #[16r40],self class customKeycustomHeaderInByte.
	self assert: indexTable dynamicTable size equals: 1.
	self assert: (headerField encodeWithPayload: indexTable) equals: #[190].
	indexTable add: 'custom' with: 'notValue'. 
	headerField := HTTP2HeaderFieldWithIndexing key: 'custom' value: 'custom-header'.
	self assert: (headerField encodeWithPayload: indexTable)
		equals: (#[16r7e], self class customHeaderInByte),#[16r72].
	self assert: indexTable dynamicTable size equals: 2.
	 