indexing
indexOfKey: aKey ifPresent: presentBlock ifAbsent: absentBlock
	| index |
	index := 1.
	self staticTable do: [:association | 
		association key ~= aKey 
			ifTrue: [index := index + 1] 
			ifFalse: [^ presentBlock value: index]]. 
	self dynamicTable do: [:association | 
		association key ~= aKey 
			ifTrue: [index := index + 1] 
			ifFalse: [^ presentBlock value: index]]. 
	^ absentBlock value