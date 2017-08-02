adding
evict: aSize
	(self dynamicSize > aSize and: self dynamicTable size > 0)
		ifTrue: [ 
			self updateDynamicSizeWithLastElement.
			self dynamicTable removeLast.
			self evict: aSize]