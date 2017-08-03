decoding
getPayloadFrom: aByteArray
	| paddingLength  |
	self flagPaddedSet ifTrue:[
	paddingLength := self getIntegerFrom: aByteArray from: self startOfPayload to: self startOfPayload. 
	self padding: (self getIntegerFrom: aByteArray from: (self length-paddingLength + 9) to: self length + 9).]