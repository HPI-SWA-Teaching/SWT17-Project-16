sending
send: aRequest
	^ self connection openStreamFor: aRequest.