testing
isAbleToSend
	^ self flowControlWindow > 10 and: self atEnd not.