responding
headerAdded
	| receivedHeader |
	
	receivedHeader := (H2Header newFrom: self headerStreamIn contents in: self connection headerTableIn).
	self headerStreamIn resetContents.
	receivedHeader dictionary at: ':status' ifPresent: [ ^self ]. "should be a trailer without it's own status (-> RFC 7540 8.1)"
	self responseHeader dictionary addAll: receivedHeader dictionary