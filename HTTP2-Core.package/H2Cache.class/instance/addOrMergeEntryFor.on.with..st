helper methods
addOrMergeEntryFor: aRequest on: server with: aPromise

	| newEntry index |

	newEntry := H2CacheEntry newForRequest: aRequest onServer: server withPromise: aPromise.
	index := self getIndexFor: aRequest on: server.
	
	^self addOrMerge: newEntry at: index
		