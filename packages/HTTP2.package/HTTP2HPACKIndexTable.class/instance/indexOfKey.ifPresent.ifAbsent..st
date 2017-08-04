indexing
indexOfKey: aKey ifPresent: presentBlock ifAbsent: absentBlock
	self staticTable withIndexDo: [:association :index| 
		association key = aKey ifTrue: [^ presentBlock value: index]]. 
	self dynamicTable withIndexDo: [:association :index| 
		association key = aKey ifTrue: [^ presentBlock value: index + self staticTable size]]. 
	^ absentBlock value