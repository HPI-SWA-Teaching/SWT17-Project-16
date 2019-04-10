encoding
encodeWithPayload: aPayload
	| payload |
	payload := aPayload.
	self flags padded ifTrue: [
		payload := (ByteArray with: self padding size), payload, self padding].
	^ super encodeWithPayload: payload