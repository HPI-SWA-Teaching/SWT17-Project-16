closing
closeOnError: errorMessage
	self connection closeStream: self.
	Project current addDeferredUIMessage: [
		self promise rejectWith: 
			(H2Error new
				messageText: errorMessage;
				yourself)]