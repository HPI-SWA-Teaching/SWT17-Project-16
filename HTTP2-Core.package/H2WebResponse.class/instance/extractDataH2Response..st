as yet unclassified
extractDataH2Response: aH2Response

	self code: (aH2Response header at: ':status') asInteger .
	self status: protocol , ' ' , self code , ' ', (self class statusCodeAt: self code).
	self content: aH2Response data asString.
	self headers:  aH2Response header asOrderedCollection  .