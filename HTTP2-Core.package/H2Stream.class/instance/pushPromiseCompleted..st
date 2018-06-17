responding
pushPromiseCompleted: anInteger
	| receivedHeader |
	
	receivedHeader := (H2Header newFrom: self headerStreamIn contents in: self connection headerTableIn).
	self headerStreamIn resetContents