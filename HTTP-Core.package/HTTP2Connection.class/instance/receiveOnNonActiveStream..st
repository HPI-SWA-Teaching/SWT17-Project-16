receiving
receiveOnNonActiveStream: aFrame
	aFrame class = HTTP2PriorityFrame
		ifTrue: ["as always: just ignore Priority Frames"]
		ifFalse:["Shouldn't have received a Frame here"]