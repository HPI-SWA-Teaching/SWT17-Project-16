receiving
receiveRSTStreamFrame: aFrame
	self stream closeOnError: 'Stream was reset before response was complete'