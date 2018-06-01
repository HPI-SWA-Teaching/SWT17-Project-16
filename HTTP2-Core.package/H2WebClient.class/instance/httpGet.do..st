methods
httpGet: anUrlString do: aBlock 
	self initializeFromUrl: anUrlString.
	(self serverProtocolDictionary includesKey: self serverName)
		ifFalse: [^ self h2cUpgradeRequest: anUrlString  do: aBlock].

	^ (self serverProtocolDictionary at: self server) = #h2c
		ifTrue: [self h2cGet: anUrlString do: aBlock]
		ifFalse: [super httpGet: anUrlString do: aBlock]