testing
testCacheMiss

	self cache getEntryFor: self request on: self class serverName ifAbsent: [ ^self ].
	
	self fail: 'The absentBlock wasn''t evaluated'.
	
	