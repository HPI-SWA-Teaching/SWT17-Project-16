testDecode
testDecodeIndexed
	|headerF|
	headerF:= HTTP2HeaderField decodeIndexed: (ReadStream on: #[16r82]) in: 		(HTTP2HPACKIndexTable newWith: 100).
	self assert: headerF equals: (HTTP2HeaderField key: ':method' value: 'GET')