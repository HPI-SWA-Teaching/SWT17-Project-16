helper methods
addOrMerge: newEntry at: index
	
	^self cache at: index
		ifPresent: [ :entry | self merge: newEntry at: index ]
		ifAbsent: [ self add: newEntry at: index ]
	