encoding
encodeWithPayload: aPayload
	| payload |
	payload := aPayload.
	self flagPaddedSet ifTrue: [ payload := (self integer: self padding size asByteArrayOfSize: 1), payload, self padding].
	^ super encodeWithPayload: payload.