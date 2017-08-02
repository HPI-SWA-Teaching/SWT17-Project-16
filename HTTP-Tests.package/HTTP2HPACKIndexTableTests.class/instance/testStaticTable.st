testing
testStaticTable
	self assert: (HTTP2HPACKIndexTable new at: 12) equals: ':status'->'400'.
	self assert: (HTTP2HPACKIndexTable new at: 47) equals: 'max-forwards'->''.
	self assert: (HTTP2HPACKIndexTable new at: 61) equals: 'www-authenticate'->''.