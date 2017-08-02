testing
testMaxDynamicSize
	| indexTable |
	indexTable := HTTP2HPACKIndexTable new.
	indexTable maxDynamicSize: 41.
	indexTable add: 'test' with: 'value'.
	self assert: indexTable dynamicTable size equals: 1.
	indexTable maxDynamicSize: 40.
	self assert: indexTable dynamicTable size equals: 0.
	indexTable add: 'test' with: 'value'.
	self assert: indexTable dynamicTable size equals: 0.