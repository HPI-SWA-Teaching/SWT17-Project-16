interface
getEntryFor: aRequest on: server ifAbsent: aBlock
	
	(self canCache: aRequest) ifFalse: [ ^aBlock value ].
	
	(self hasValidEntryFor: aRequest on: server)
		ifTrue: [ ^(self cache at: (self getIndexFor: aRequest on: server)) promise ]
		ifFalse: [ ^(self addOrMergeEntryFor: aRequest on: server with: aBlock value) promise ]