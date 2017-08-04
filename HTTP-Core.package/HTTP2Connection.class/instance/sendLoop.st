sending
sendLoop
	[self connectionActive] whileTrue: [
		self sufficientFlowControlWindow ifTrue: [self send].
		(Delay forMilliseconds: self class standardWaitingTime) wait]