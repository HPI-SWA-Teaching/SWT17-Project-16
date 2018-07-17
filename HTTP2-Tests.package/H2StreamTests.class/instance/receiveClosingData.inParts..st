helper
receiveClosingData: aByteArray inParts: number
	
	number = 1 ifTrue: [ ^ (self class veryLastDataFrameFor: aByteArray) receiveOnStream: stream ].
	
	(self class unflaggedDataFrameFor: (self part: 0 of: number from: aByteArray)) receiveOnStream: stream.
	
	1 to: (number - 2) do: [ :num |
		(self class unflaggedDataFrameFor: (self part: num of: number from: aByteArray)) receiveOnStream: stream ].
	
	(self class veryLastDataFrameFor: (self part: number - 1 of: number from: aByteArray)) receiveOnStream: stream
	
	