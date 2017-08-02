as yet unclassified
transition
	self stream deliverResponse.
	super transition.
	self stream closeStreamIfFinished