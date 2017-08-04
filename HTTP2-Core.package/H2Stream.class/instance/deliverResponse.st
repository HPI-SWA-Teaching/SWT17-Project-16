responding
deliverResponse
	Project current addDeferredUIMessage: [
			self promise resolveWith: 
				((H2Response new) 
					header: self responseHeader; 
					data: self byteStreamIn contents);
					yourself]