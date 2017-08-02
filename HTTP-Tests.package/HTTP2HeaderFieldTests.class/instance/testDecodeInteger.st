testDecode
testDecodeInteger
	self assert: (HTTP2HeaderField decodeInteger: (ReadStream on:#[10]) prefix: 5)  equals:10 . 
	self assert: (HTTP2HeaderField decodeInteger: (ReadStream on:#[31 154 10]) prefix: 5)  equals: 1337. 
	self assert: (HTTP2HeaderField decodeInteger: (ReadStream on:#[42]) prefix: 8)  equals: 42. 