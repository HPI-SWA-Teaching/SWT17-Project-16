testing
testFillAndEmpty

	self testAddCacheEntry.
	self cache empty.
	self assert: self cache cache equals: Dictionary new.