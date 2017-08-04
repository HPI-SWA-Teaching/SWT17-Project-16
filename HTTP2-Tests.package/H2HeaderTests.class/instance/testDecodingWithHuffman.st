testing
testDecodingWithHuffman
	| header indexTable encodedHeaders testHeaders |
	indexTable := H2HPACKIndexTable new.
	encodedHeaders := self class encodedHuffmanTestHeaders.
	header := H2Header newFrom: encodedHeaders first in: indexTable.
	testHeaders := self class evictionTestHeaders.
	self assert: header equals: testHeaders first.
	header := H2Header newFrom: encodedHeaders second in: indexTable.
	self assert: header equals: testHeaders second.