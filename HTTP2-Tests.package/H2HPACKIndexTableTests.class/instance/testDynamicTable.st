testing
testDynamicTable
	| indexTable |
	indexTable := H2HPACKIndexTable new.
	indexTable maxDynamicSize: 100.
	self assert: indexTable dynamicTable isEmpty.
	self assert: indexTable dynamicTable isEmpty.
	indexTable add: 'test' with: 'value'.
	self assert: indexTable dynamicSize equals: 41.
	self assert: (indexTable at: 62) equals: 'test'->'value'.
	indexTable add: 'test2' with: 'value2'.
	self assert: indexTable dynamicSize equals: 84.
	self assert: (indexTable at: 62) equals: 'test2'->'value2'.
	self assert: (indexTable at: 63) equals: 'test'->'value'.
	indexTable add: 'test3' with: 'value3'.
	self assert: indexTable dynamicSize equals: 86.
	self assert: (indexTable at: 62) equals: 'test3'->'value3'.
	self assert: (indexTable at: 63) equals: 'test2'->'value2'.
	self assert: indexTable dynamicTable size equals: 2.
	indexTable add: 'tooLarge' with: 'I am a String which is much too large to be added to this dynamicTable. Therefore I will cause all elements to be evicted'.
	self assert: indexTable dynamicTable isEmpty.
	self assert: indexTable dynamicTable isEmpty