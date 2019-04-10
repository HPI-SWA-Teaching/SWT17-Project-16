responding
pushPromiseCompleted: newStreamId
	| receivedRequestHeader h2Stream |
	
	receivedRequestHeader := (H2Header newFrom: self headerStreamIn contents in: self connection headerTableIn).
	self headerStreamIn resetContents.
	
	h2Stream := self connection openStreamWithId: newStreamId.
	h2Stream request: (H2Request new header: receivedRequestHeader).
	h2Stream sender: (H2NullSender newFor: h2Stream). "technically this should happen after the first header of the response arrives (RFC 7540 8.2.2)"