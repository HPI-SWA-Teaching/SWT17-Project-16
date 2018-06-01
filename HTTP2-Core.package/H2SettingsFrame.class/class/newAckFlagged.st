instance creation
newAckFlagged
	| instance |
	instance := self new.
	instance flags ack: true.
	^ instance