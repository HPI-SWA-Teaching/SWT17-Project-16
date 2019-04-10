helper methods
merge: newEntry at: index

	^(self cache at: index) merge: newEntry
	