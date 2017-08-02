closing
closeConnection
	self connectionActive: false.
	self socketStream nextPutAll: (HTTP2GoawayFrame new streamIdentifier: 0; lastID: 2; errorCode: 0; debugData: ''; yourself) encode.
	self responseToUnfinishedRequests.
	self socketStream close.