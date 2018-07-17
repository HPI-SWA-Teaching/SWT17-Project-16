testing
testFillAndClear

	self testAddCacheEntry.
	self cache clear.
	self assert: self cache cache equals: Dictionary new.