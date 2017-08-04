testDecode
testDecodeWithoutIndexing
	| headerF indexTable |
	indexTable := H2HPACKIndexTable newWith: 100.
	headerF := H2HeaderField decodeLiteralWithoutIndexing: 
		(ReadStream on: #[16r01], self class authorityExampleInByte ) in: indexTable.
	self assert: headerF equals: (H2HeaderField key: ':authority' value: 'www.example.com').
	self assert: indexTable dynamicTable isEmpty.
	headerF := H2HeaderField decodeLiteralWithoutIndexing: 
		(ReadStream on: #[16r40],self class customKeycustomValueInByte ) in: indexTable.
	self assert: headerF equals: (H2HeaderField key: 'custom-key' value: 'custom-value').
	self assert: indexTable dynamicTable isEmpty