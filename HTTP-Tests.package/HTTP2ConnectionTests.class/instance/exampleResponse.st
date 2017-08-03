as yet unclassified
exampleResponse
	^ HTTP2Response new
		header: (HTTP2Header new
			add: ':status' -> '200';
			add: 'content-length' -> '9';
			add: 'content-type' -> 'text/html';
			add: 'accept-ranges' -> 'bytes';
			yourself);
		data: 'some data';
		yourself.