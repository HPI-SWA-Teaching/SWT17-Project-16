testDecode
testDecodeIndexed
	|headerF|
	headerF:= H2HeaderField decodeIndexed: (ReadStream on: #[16r82]) in: 		(H2HPACKIndexTable newWith: 100).
	self assert: headerF equals: (H2HeaderField key: ':method' value: 'GET')