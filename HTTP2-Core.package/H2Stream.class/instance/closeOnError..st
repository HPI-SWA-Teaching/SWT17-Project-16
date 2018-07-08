closing
closeOnError: errorMessage
	self connection closeStream: self.
	self promise rejectWith: 
		(H2Error new
			messageText: errorMessage;
			yourself)