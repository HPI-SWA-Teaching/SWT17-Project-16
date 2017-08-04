instance creation
newWith: maxSize
	^self new 
		maxDynamicSize: maxSize;
		yourself