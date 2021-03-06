helper
receiveHeader: header inParts: number
	| block |
	
	block := header encode: indexTable.
	
	number = 1 ifTrue: [ ^ (self class lastHeaderFrameFor: block) receiveOnStream: stream ].
	
	(self class unflaggedHeaderFrameFor: (self part: 0 of: number from: block)) receiveOnStream: stream.
	
	1 to: (number - 2) do: [ :num |
		(self class unflaggedContinuationFrameFor: (self part: num of: number from: block)) receiveOnStream: stream ].
	
	(self class lastContinuationFrameFor: (self part: number - 1 of: number from: block)) receiveOnStream: stream
	
	