indexing
indexOf: anAssociation ifPresent: presentBlock ifAbsent: absentBlock
	| index |
	index := self staticTable indexOf: anAssociation ifAbsent: [
		index := self dynamicTable indexOf: anAssociation ifAbsent: [^ absentBlock value].  
		^ presentBlock value: index + self staticTable size].
	^ presentBlock value: index.