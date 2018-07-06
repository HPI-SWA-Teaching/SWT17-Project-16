running
setUp
	
	self cache: H2Cache new.
	self request: self class cacheableRequest.
	self promise: (Promise unit: 'resolvedValue')