testDecode
testDecodeStringWithHuffman
| encodedString|
	encodedString := #[16r8c 16rf1 16re3 16rc2 16re5 16rf2 16r3a 16r6b
		16ra0 16rab 16r90 16rf4 16rff].
	self assert:(H2HeaderField decodeString: (ReadStream on: encodedString)) 
		equals: 'www.example.com'.
	encodedString := #[16r86 16ra8 16reb 16r10 16r64 16r9c 16rbf].
	self assert:(H2HeaderField decodeString: (ReadStream on: encodedString)) 
		equals:  'no-cache'.
	encodedString := #[16r88 16r25 16ra8 16r49 16re9 16r5b 16ra9 16r7d 16r7f].
	self assert:(H2HeaderField decodeString: (ReadStream on: encodedString)) 
		equals:  'custom-key'.
	encodedString := #[16r89 16r25 16ra8 16r49 16re9 16r5b 16rb8 16re8 16rb4 16rbf].
	self assert:(H2HeaderField decodeString: (ReadStream on: encodedString)) 
		equals:  'custom-value'