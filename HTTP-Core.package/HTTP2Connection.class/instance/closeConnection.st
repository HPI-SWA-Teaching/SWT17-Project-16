closing
closeConnection
	self connectionActive: false.
	self socketStream nextPutAll: 
		self class standardGoawayFrame encode.
	self responseToUnfinishedRequests.
	self socketStream close.