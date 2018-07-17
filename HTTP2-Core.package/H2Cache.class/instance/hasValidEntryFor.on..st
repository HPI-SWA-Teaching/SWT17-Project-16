interface
hasValidEntryFor: aRequest on: server

	| index |
	
	index := self getIndexFor: aRequest on: server.

	self cache at: index
		ifPresent: [ :entry | ^entry stillValid ] 
		ifAbsent: [ ^false ]