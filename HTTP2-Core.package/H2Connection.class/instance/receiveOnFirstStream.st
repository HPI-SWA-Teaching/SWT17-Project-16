receiving
receiveOnFirstStream
	| id http2stream |
	self canOpenNewStream ifFalse: [^ H2Error signal: 'Too many parallel requests'].
	
	id := 1.
	http2stream := H2Stream new: id for: nil connection: self.
	http2stream sender: H2NullSender new .
	self activeStreams at: id put: http2stream.
	^ http2stream promise