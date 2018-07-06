testing
canCache: aRequest

	(self hasCacheableMethod: aRequest) ifFalse: [ ^false ].

	^true.