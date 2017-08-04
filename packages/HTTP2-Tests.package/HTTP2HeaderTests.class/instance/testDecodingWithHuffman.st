testing
testDecodingWithHuffman
	| header indexTable encodedHeaders testHeaders |
	indexTable := HTTP2HPACKIndexTable new.
	encodedHeaders := self class encodedHuffmanTestHeaders.
	header := HTTP2Header newFrom: encodedHeaders first in: indexTable.
	testHeaders := self class evictionTestHeaders.
	self assert: header equals: testHeaders first.
	header := HTTP2Header newFrom: encodedHeaders second in: indexTable.
	self assert: header equals: testHeaders second.