methods
httpGet: anUrlString do: aBlock 

self initializeFromUrl: anUrlString.
(self serverProtocolDictionary at: self server ifAbsent:[
	^ self h2cUpgradeRequest: anUrlString  do: aBlock ])= #h2c 
	ifTrue:[
		^ self h2cGet: anUrlString do: aBlock ]
	ifFalse: [
		^ super httpGet: anUrlString do: aBlock.
	]