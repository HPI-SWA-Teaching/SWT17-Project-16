accessing
setValue: aValue For: searchPathInt with: ANDDecisionInt
	
	(((searchPathInt bitAnd: ANDDecisionInt) = 0) ifTrue: [
		self zero ifNil: [ self zero: (((ANDDecisionInt >> 1 = 0) ifTrue: [
				PrefixTreeLeaf 
				] 
			ifFalse: [
				PrefixTreeNode 
				]) new ).
		self zero ]
	] ifFalse: [
		self one ifNil: [ self one: (((ANDDecisionInt >> 1) = 0) ifTrue: [
				PrefixTreeLeaf 
				] 
			ifFalse: [
				PrefixTreeNode 
				]) new .
		self one ]
		] )  setValue: aValue For: searchPathInt with: (ANDDecisionInt >> 1).