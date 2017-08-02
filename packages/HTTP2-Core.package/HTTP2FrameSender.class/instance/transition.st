as yet unclassified
transition
	self shouldChangeState ifTrue: [
		self stream sender: (self nextState newFor: self stream).
		self stream sender transition]