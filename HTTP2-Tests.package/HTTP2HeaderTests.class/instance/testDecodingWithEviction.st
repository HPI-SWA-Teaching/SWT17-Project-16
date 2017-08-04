testing
testDecodingWithEviction
	| header indexTable encodedHeaders testHeader |
	indexTable := HTTP2HPACKIndexTable newWith: 256.
	encodedHeaders := self class encodedEvictionTestHeaders.
	header := HTTP2Header newFrom: encodedHeaders first in: indexTable.
	testHeader := self class evictionTestHeaders.
	self assert: header equals: testHeader first.
	self assert: header size equals: 4.
	self assert: (indexTable at: 65) equals: ':status'->'302'.
	self assert: (indexTable at: 64) equals: 'cache-control'->'private'.
	self assert: (indexTable at: 63) equals: 'date'->'Mon, 21 Oct 2013 20:13:21 GMT'.
	self assert: (indexTable at: 62) equals: 'location'->'https://www.example.com'.
	self assert: indexTable dynamicTable size equals: 4.
	header := HTTP2Header newFrom: encodedHeaders second in: indexTable.
	self assert: header equals: testHeader second.
	self assert: header size equals: 4.
	self assert: (indexTable at: 62) equals: ':status'->'307'.
	self assert: (indexTable at: 65) equals: 'cache-control'->'private'.
	self assert: (indexTable at: 64) equals: 'date'->'Mon, 21 Oct 2013 20:13:21 GMT'.
	self assert: (indexTable at: 63) equals: 'location'->'https://www.example.com'.
	self assert: indexTable dynamicTable size equals: 4.
	header := HTTP2Header newFrom: encodedHeaders third in: indexTable.
	self assert: header equals: testHeader third.
	self assert: header size equals: 6.
	self assert: (indexTable at: 62) equals: 'set-cookie'->'foo=ASDJKHQKBZXOQWEOPIUAXQWEOIU; max-age=3600; version=1'.
	self assert: (indexTable at: 63) equals: 'content-encoding'->'gzip'.
	self assert: (indexTable at: 64) equals: 'date'->'Mon, 21 Oct 2013 20:13:22 GMT'.
	self assert: indexTable dynamicTable size equals: 3.