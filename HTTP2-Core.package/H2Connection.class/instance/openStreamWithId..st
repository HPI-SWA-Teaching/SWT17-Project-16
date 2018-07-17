requesting
openStreamWithId: id
	| h2stream |
	self activeStreams size < self maxConcurrentStreams ifFalse: [ ^ H2Error signal: 'Too many parallel requests' ].
	h2stream := H2Stream new: id on: self.
	self activeStreams at: id put: h2stream.
	^ h2stream