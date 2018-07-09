responding
deliverResponse
	self promise resolveWith: 
		(H2Response new
			header: self responseHeader; 
			data: self dataStreamIn contents;
			yourself)