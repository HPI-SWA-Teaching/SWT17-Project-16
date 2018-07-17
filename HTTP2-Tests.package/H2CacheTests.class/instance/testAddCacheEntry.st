testing
testAddCacheEntry
	| entry |
	
	self cache addOrMergeEntryFor: self request on: self class serverName with: self promise.
	
	entry := self cache cache at: (self cache getIndexFor: self request on: self class serverName).
	
	self
		assert: self class serverName equals: entry server;
		assert: self request equals: entry request;
		assert: self promise equals: entry promise.