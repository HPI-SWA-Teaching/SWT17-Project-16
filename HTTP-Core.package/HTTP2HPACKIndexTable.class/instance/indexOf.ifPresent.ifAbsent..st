indexing
indexOf: anAssociation ifPresent: presentBlock ifAbsent: absentBlock
	| index |
	index := self staticTable indexOf: anAssociation.
	index ~= 0 ifTrue: [^ presentBlock value: index].
	index := self dynamicTable indexOf: anAssociation.
	index = 0 ifTrue: [^ absentBlock value]  ifFalse: [ ^ presentBlock value: index + 61] 