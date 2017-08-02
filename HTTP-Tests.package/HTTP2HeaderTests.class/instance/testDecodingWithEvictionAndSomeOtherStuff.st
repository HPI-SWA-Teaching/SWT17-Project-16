testing
testDecodingWithEvictionAndSomeOtherStuff
	| header indexTable |
	indexTable := HTTP2HPACKIndexTable newWith: 256.
	header := HTTP2Header newFrom: #[16r48 16r03 16r33 16r30 16r32 16r58 16r07 16r70 16r72 16r69 16r76 16r61 16r74 16r65 16r61 16r1d 16r4d 16r6f 16r6e 16r2c 16r20 16r32 16r31 16r20 16r4f 16r63 16r74 16r20 16r32 16r30 16r31 16r33 16r20 16r32 16r30 16r3a 16r31 16r33 16r3a 16r32 16r31 16r20 16r47 16r4d 16r54 16r6e 16r17 16r68 16r74 16r74 16r70 16r73 16r3a 16r2f 16r2f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d] in: indexTable.
	self assert: (header at: ':status') equals: '302'.
	self assert: (header at: 'cache-control') equals: 'private'.
	self assert: (header at: 'date') equals: 'Mon, 21 Oct 2013 20:13:21 GMT'.
	self assert: (header at: 'location') equals: 'https://www.example.com'.
	self assert: header size equals: 4.
	self assert: (indexTable at: 65) equals: ':status'->'302'.
	self assert: (indexTable at: 64) equals: 'cache-control'->'private'.
	self assert: (indexTable at: 63) equals: 'date'->'Mon, 21 Oct 2013 20:13:21 GMT'.
	self assert: (indexTable at: 62) equals: 'location'->'https://www.example.com'.
	self assert: indexTable dynamicTable size equals: 4.
	header := HTTP2Header newFrom: #[16r48 16r03 16r33 16r30 16r37 16rc1 16rc0 16rbf] in: indexTable.
	self assert: (header at: ':status') equals: '307'.
	self assert: (header at: 'cache-control') equals: 'private'.
	self assert: (header at: 'date') equals: 'Mon, 21 Oct 2013 20:13:21 GMT'.
	self assert: (header at: 'location') equals: 'https://www.example.com'.
	self assert: header size equals: 4.
	self assert: (indexTable at: 62) equals: ':status'->'307'.
	self assert: (indexTable at: 65) equals: 'cache-control'->'private'.
	self assert: (indexTable at: 64) equals: 'date'->'Mon, 21 Oct 2013 20:13:21 GMT'.
	self assert: (indexTable at: 63) equals: 'location'->'https://www.example.com'.
	self assert: indexTable dynamicTable size equals: 4.
	header := HTTP2Header newFrom: #[16r88 16rc1 16r61 16r1d 16r4d 16r6f 16r6e 16r2c 16r20 16r32 16r31 16r20 16r4f 16r63 16r74 16r20 16r32 16r30 16r31 16r33 16r20 16r32 16r30 16r3a 16r31 16r33 16r3a 16r32 16r32 16r20 16r47 16r4d 16r54 16rc0 16r5a 16r04 16r67 16r7a 16r69 16r70 16r77 16r38 16r66 16r6f 16r6f 16r3d 16r41 16r53 16r44 16r4a 16r4b 16r48 16r51 16r4b 16r42 16r5a 16r58 16r4f 16r51 16r57 16r45 16r4f 16r50 16r49 16r55 16r41 16r58 16r51 16r57 16r45 16r4f 16r49 16r55 16r3b 16r20 16r6d 16r61 16r78 16r2d 16r61 16r67 16r65 16r3d 16r33 16r36 16r30 16r30 16r3b 16r20 16r76 16r65 16r72 16r73 16r69 16r6f 16r6e 16r3d 16r31] in: indexTable.
	self assert: (header at: ':status') equals: '200'.
	self assert: (header at: 'cache-control') equals: 'private'.
	self assert: (header at: 'date') equals: 'Mon, 21 Oct 2013 20:13:22 GMT'.
	self assert: (header at: 'location') equals: 'https://www.example.com'.
	self assert: (header at: 'content-encoding') equals: 'gzip'.
	self assert: (header at: 'set-cookie') equals: 'foo=ASDJKHQKBZXOQWEOPIUAXQWEOIU; max-age=3600; version=1'.
	self assert: header size equals: 6.
	self assert: (indexTable at: 62) equals: 'set-cookie'->'foo=ASDJKHQKBZXOQWEOPIUAXQWEOIU; max-age=3600; version=1'.
	self assert: (indexTable at: 63) equals: 'content-encoding'->'gzip'.
	self assert: (indexTable at: 64) equals: 'date'->'Mon, 21 Oct 2013 20:13:22 GMT'.
	self assert: indexTable dynamicTable size equals: 3.