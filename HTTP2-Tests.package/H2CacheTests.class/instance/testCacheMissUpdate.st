testing
testCacheMissUpdate

	| promise newEntry |
	
	promise := Promise unit: 'newResolvedValue'.
	newEntry := self cache getEntryFor: self request on: self class serverName ifAbsent: [ promise ].
	
	self assert: promise equals: newEntry
	
	