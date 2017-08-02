responding
headerCompleted
	self responseHeader: (HTTP2Header newFrom: self byteStreamIn contents in: self streamManager headerTableIn).
	self byteStreamIn resetContents