responding
headerCompleted
	self responseHeader: 
		(HTTP2Header newFrom: self byteStreamIn contents in: self connection headerTableIn).
	self byteStreamIn resetContents