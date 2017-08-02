encoding
calculateSolutionFor: anInteger index: anIndex in: aByteArray
	(anInteger >= 128) ifTrue: [
		^ self calculateSolutionFor: (anInteger >> 7) 
			index: anIndex + 1
			in: (aByteArray at: anIndex put: anInteger \\ 128 + 128 ; yourself).]
	ifFalse: [ 
		aByteArray at: anIndex put: anInteger.
		^ aByteArray]