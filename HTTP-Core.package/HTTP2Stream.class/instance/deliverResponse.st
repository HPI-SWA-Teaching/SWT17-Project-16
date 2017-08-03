responding
deliverResponse
	Project current addDeferredUIMessage: [
			self promise resolveWith: 
				((HTTP2Response new) header: self responseHeader; data: self byteStreamIn contents).]