accessing
at: anIndex
	anIndex > 61 
		ifTrue: [^ self dynamicTable at: (anIndex - 61) ]
		ifFalse: [^ self staticTable at: anIndex]