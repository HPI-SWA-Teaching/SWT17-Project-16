state handling
transition
	self stream receiver: (self nextState newFor: self stream)