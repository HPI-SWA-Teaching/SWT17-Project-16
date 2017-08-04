responding
headerCompleted
	self responseHeader: 
		(H2Header newFrom: self byteStreamIn contents in: self connection headerTableIn).
	self byteStreamIn resetContents