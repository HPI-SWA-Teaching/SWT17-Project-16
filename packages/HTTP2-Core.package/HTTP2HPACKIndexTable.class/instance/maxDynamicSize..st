accessing
maxDynamicSize: aSize
	maxDynamicSize := aSize.
	self evict: aSize.