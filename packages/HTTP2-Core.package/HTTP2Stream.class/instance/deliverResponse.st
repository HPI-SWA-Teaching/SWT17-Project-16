responding
deliverResponse
	| response |
	response := (HTTP2Response new)
		header: self responseHeader;
		data: self byteStreamIn contents.
	Project current addDeferredUIMessage: [self promise resolveWith: response]