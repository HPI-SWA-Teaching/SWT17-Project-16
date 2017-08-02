as yet unclassified
testEncoding
	| header indexTable |
	indexTable := HTTP2HPACKIndexTable newWith: 1000."large enough to don't cause any evictions"
	header := HTTP2Header new.
	header 
		add: ':method'->'GET';
		add: ':scheme'->'http';
		add: ':path' ->'/';
		add: ':authority'->'www.example.com'.
	self assert: (header encode: indexTable) equals: #[16r82 16r86 16r84 16r41 16r0f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d].
	header add: 'cache-control'->'no-cache'.
	self assert: (header encode: indexTable) equals: #[16r82 16r86 16r84 16rbe 16r58 16r08 16r6e 16r6f 16r2d 16r63 16r61 16r63 16r68 16r65].
	header := HTTP2Header new.
	header 
		add: ':method'->'GET';
		add: ':scheme'->'https';
		add: ':path' ->'/index.html';
		add: ':authority'->'www.example.com';
		addWithoutIndexing: 'custom-key' value: 'custom-value'.
	self assert: (header encode: indexTable) equals: #[16r82 16r87 16r85 16rbf 16r00 16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79 16r0c 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r76 16r61 16r6c 16r75 16r65].
	header addNeverIndexing: 'password' value: 'secret' .
	self assert: (header encode: indexTable) equals: #[16r82 16r87 16r85 16rbf 16r00 16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79 16r0c 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r76 16r61 16r6c 16r75 16r65 16r10 16r08 16r70 16r61 16r73 16r73 16r77 16r6f 16r72 16r64 16r06 16r73 16r65 16r63 16r72 16r65 16r74].