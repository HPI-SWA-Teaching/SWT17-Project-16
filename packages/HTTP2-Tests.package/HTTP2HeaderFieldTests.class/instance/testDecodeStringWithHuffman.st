testDecode
testDecodeStringWithHuffman
| decoded encoded encodedString|

	encoded := #[16r9d 16r29 16rad 16r17 16r18 16r63 16rc7 16r8f 16r0b 16r97 16rc8 16re9 16rae 16r82 16rae 16r43 16rd3].
	"https://www.example.com"
	decoded :=  #[104 116 116 112 115 58 47 47 119 119 119 46 101 120 97 109 112 108 101 46 99 111 109].

	self assert: decoded equals: (HTTP2Header decodeHuffman: (HTTP2Header encodeHuffman: decoded)).

	encodedString := #[16r8c 16rf1 16re3 16rc2 16re5 16rf2 16r3a 16r6b 16ra0 16rab 16r90 16rf4 16rff].
	self assert:(HTTP2HeaderField decodeString: (ReadStream on: encodedString)) equals:  'www.example.com'.
	
	encodedString := #[16r86 16ra8 16reb 16r10 16r64 16r9c 16rbf].
	self assert:(HTTP2HeaderField decodeString: (ReadStream on: encodedString)) equals:  'no-cache'.
	
	encodedString := #[16r88 16r25 16ra8 16r49 16re9 16r5b 16ra9 16r7d 16r7f].
	self assert:(HTTP2HeaderField decodeString: (ReadStream on: encodedString)) equals:  'custom-key'.
	
	encodedString := #[16r89 16r25 16ra8 16r49 16re9 16r5b 16rb8 16re8 16rb4 16rbf].
	self assert:(HTTP2HeaderField decodeString: (ReadStream on: encodedString)) equals:  'custom-value'.