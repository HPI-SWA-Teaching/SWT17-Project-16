state handling
transition
	self stream deliverResponse.
	super transition.
	self stream closeStreamIfFinished