responding
headerCompleted
	| receivedHeader |
	
	receivedHeader := (H2Header newFrom: self headerStreamIn contents in: self connection headerTableIn).
	self headerStreamIn resetContents.
	receivedHeader at: ':status' ifAbsent: [ ^self ]. "malformed request -> RFC 7540 8.1.2.4."
	((receivedHeader at: ':status') < '200') ifTrue: [ ^self ]. "100 and 102 don't need handling, 101 does"
	self responseHeader: receivedHeader