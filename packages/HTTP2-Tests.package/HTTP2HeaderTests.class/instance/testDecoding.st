testing
testDecoding
	| header indexTable encodedHeaders testHeaders |
	indexTable := HTTP2HPACKIndexTable newWith: 200.
	encodedHeaders := self class encodedTestHeaders.
	testHeaders := self class testHeaders. 
	header := HTTP2Header newFrom: encodedHeaders first in: indexTable.
	self assert: header equals: self class standardHeader.
	self assert: header size equals: 4.
	self assert: (indexTable at: 62) equals: ':authority'->'www.example.com'.
	header := HTTP2Header newFrom: encodedHeaders second in: indexTable.
	self assert: header equals: testHeaders first.
	self assert: header size equals: 5.
	self assert: (indexTable at: 62) equals: 'cache-control'->'no-cache'.
	header := HTTP2Header newFrom: encodedHeaders third in: indexTable.
	self assert: header equals: testHeaders second.
	self assert: header size equals: 5.
	self assert: (indexTable at: 62) equals: 'cache-control'->'no-cache'.