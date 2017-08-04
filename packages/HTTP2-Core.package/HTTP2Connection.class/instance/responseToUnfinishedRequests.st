closing
responseToUnfinishedRequests
	self activeStreams do: [:stream |
		stream closeOnError: 'Connection was closed before the response was complete']