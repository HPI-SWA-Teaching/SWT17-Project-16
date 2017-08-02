requesting
openStreamFor: aRequest
	| id http2stream |
	self connectionActive ifTrue: [
		self activeStreams size < self maxConcurrentStreams ifTrue:[
			id := self nextFreeStreamIdPostIncrement.
			http2stream := HTTP2Stream new: id for: aRequest streamManager: self.
			self activeStreams at: id put: http2stream.
			^ http2stream promise]
		ifFalse: [HTTP2Error signal: 'Too many parallel requests']]
	ifFalse: [HTTP2Error signal: 'The connection is closed']