accessing
getNodeFor: searchString with: ANDDecisionString
	^ (((searchString bitAnd: ANDDecisionString) = 0) ifTrue: [
		self zero 
		] ifFalse: [
		self one
		] ) 