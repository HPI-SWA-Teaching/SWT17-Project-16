testEncode
testEncodeWithIndexing
	| headerField indexTable |
	headerField := H2HeaderFieldWithIndexing key: 'custom-key' value: 'custom-header'.
	indexTable := H2HPACKIndexTable newWith: 100.
	self assert: (headerField encodeWithPayload: indexTable) 
		equals: #[16r40],self class customKeycustomHeaderInByte.
	self assert: indexTable dynamicTable size equals: 1.
	self assert: (headerField encodeWithPayload: indexTable) equals: #[190].
	indexTable add: 'custom' with: 'notValue'. 
	headerField := H2HeaderFieldWithIndexing key: 'custom' value: 'custom-header'.
	self assert: (headerField encodeWithPayload: indexTable)
		equals: (#[16r7e], self class customHeaderInByte),#[16r72].
	self assert: indexTable dynamicTable size equals: 2.
	 