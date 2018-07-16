testing
testCacheHit
	| cachedEntry |
	
	self cache addOrMergeEntryFor: self request on: self class serverName with: self promise.
	cachedEntry := self cache getEntryFor: self request on: self class serverName
		ifAbsent: [ self fail: 'The entry was''nt returned'. ].
	
	self assert: self promise equals: cachedEntry.