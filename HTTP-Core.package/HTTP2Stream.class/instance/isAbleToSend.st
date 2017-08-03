testing
isAbleToSend
	^ self flowControlWindow > self class minimumFlowControlWindowSize and: self atEnd not