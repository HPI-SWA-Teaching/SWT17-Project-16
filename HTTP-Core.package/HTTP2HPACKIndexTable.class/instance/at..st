accessing
at: anIndex
	anIndex > self staticTable size
		ifTrue: [^ self dynamicTable at: (anIndex - self staticTable size) ]
		ifFalse: [^ self staticTable at: anIndex]