testEncode
testEncodeInteger
	self assert: (HTTP2HeaderField new encodeInteger: 10 with: 5)  equals: #[10]. 
	self assert: (HTTP2HeaderField new encodeInteger: 1337 with: 5)  equals: #[31 154 10]. 
	self assert: (HTTP2HeaderField new encodeInteger: 42 with: 8)  equals: #[42]. 
	