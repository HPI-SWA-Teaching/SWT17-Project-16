adding
add: key with: value
	| size |
	size := key byteSize + value byteSize + self class overheadBuffer.
	self evict: self maxDynamicSize - size.
	size <= self maxDynamicSize 
		ifTrue: [ self dynamicTable addFirst: key->value.
			self dynamicSize: self dynamicSize + size ]