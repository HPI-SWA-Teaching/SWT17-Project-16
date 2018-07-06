testing
hasCacheableMethod: aRequest
	
	^self class cacheableMethods includes: (aRequest header at: ':method')