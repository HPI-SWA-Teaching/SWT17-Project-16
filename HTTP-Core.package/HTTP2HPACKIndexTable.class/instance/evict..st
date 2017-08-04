adding
evict: aSize
	(self dynamicSize > aSize and: self dynamicTable isEmpty not)
		ifTrue: [ 
			self updateDynamicSizeWithLastElement.
			self dynamicTable removeLast.
			self evict: aSize]