testDecode
testDecodeWithIndexing
	| headerField indexTable |
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	headerField := HTTP2HeaderField decodeLiteralWithIndexing: 
		(ReadStream on: #[16r41], self class authorityExampleInByte ) in: indexTable.
	self assert: headerField 
		equals: (HTTP2HeaderField key: ':authority' value: 'www.example.com').
	self assert: (indexTable at: 62) 
		equals: (HTTP2HeaderField key: ':authority' value: 'www.example.com').
	headerField := HTTP2HeaderField decodeLiteralWithIndexing: (
	ReadStream on: #[16r40], self class customKeycustomValueInByte) in: indexTable.
	self assert: headerField equals: (HTTP2HeaderField key: 'custom-key' value: 'custom-value').
	self assert: (indexTable at: 62) equals: 
		(HTTP2HeaderField key: 'custom-key' value: 'custom-value')