testing
testDecoding
	| header indexTable |
	indexTable := HTTP2HPACKIndexTable newWith: 200.
	header := HTTP2Header newFrom: #[16r82 16r86 16r84 16r41 16r0f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d] in: indexTable.
	self assert: (header at: ':method') equals: 'GET'.
	self assert: (header at: ':scheme') equals: 'http'.
	self assert: (header at: ':path') equals: '/'.
	self assert: (header at: ':authority') equals: 'www.example.com'.
	self assert: header size equals: 4.
	self assert: (indexTable at: 62) equals: ':authority'->'www.example.com'.
	header := HTTP2Header newFrom: #[16r82 16r86 16r84 16rbe 16r58 16r08 16r6e 16r6f 16r2d 16r63 16r61 16r63 16r68 16r65] in: indexTable.
	self assert: (header at: ':method') equals: 'GET'.
	self assert: (header at: ':scheme') equals: 'http'.
	self assert: (header at: ':path') equals: '/'.
	self assert: (header at: ':authority') equals: 'www.example.com'.
	self assert: (header at: 'cache-control') equals: 'no-cache'.
	self assert: header size equals: 5.
	self assert: (indexTable at: 62) equals: 'cache-control'->'no-cache'.
	header := HTTP2Header newFrom: #[16r82 16r87 16r85 16rbf 16r40 16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79 16r0c 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r76 16r61 16r6c 16r75 16r65] in: indexTable.
	self assert: (header at: ':method') equals: 'GET'.
	self assert: (header at: ':scheme') equals: 'https'.
	self assert: (header at: ':path') equals: '/index.html'.
	self assert: (header at: ':authority') equals: 'www.example.com'.
	self assert: (header at: 'custom-key') equals: 'custom-value'.
	self assert: header size equals: 5.
	self assert: (indexTable at: 62) equals: 'custom-key'->'custom-value'.