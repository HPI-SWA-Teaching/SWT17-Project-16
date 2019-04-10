state handling
transition: nextState
	self stream receiver: (nextState newFor: self stream from: self)