closing
socketClosed
	self connectionActive ifTrue: [
		self responseToUnfinishedRequests.
		self connectionActive: false.]