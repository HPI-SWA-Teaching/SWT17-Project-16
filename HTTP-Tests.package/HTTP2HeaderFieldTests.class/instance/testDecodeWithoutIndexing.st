testDecode
testDecodeWithoutIndexing
	| headerF indexTable |
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	headerF := HTTP2HeaderField decodeLiteralWithoutIndexing: (ReadStream on: #[16r01], self class authorityExampleInByte ) in: indexTable.
	self assert: headerF equals: (HTTP2HeaderField key: ':authority' value: 'www.example.com').
	self assert: indexTable dynamicTable size equals: 0.
	headerF := HTTP2HeaderField decodeLiteralWithoutIndexing: (ReadStream on: #[16r40],self class customKeycustomValueinByte ) in: indexTable.
	self assert: headerF equals: (HTTP2HeaderField key: 'custom-key' value: 'custom-value').
	self assert: indexTable dynamicTable size equals: 0.