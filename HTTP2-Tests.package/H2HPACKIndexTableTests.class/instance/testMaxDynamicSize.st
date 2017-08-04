testing
testMaxDynamicSize
	| indexTable |
	indexTable := H2HPACKIndexTable new.
	indexTable maxDynamicSize: 41.
	indexTable add: 'test' with: 'value'.
	self assert: indexTable dynamicTable size equals: 1.
	indexTable maxDynamicSize: 40.
	self assert: indexTable dynamicTable isEmpty.
	indexTable add: 'test' with: 'value'.
	self assert: indexTable dynamicTable isEmpty