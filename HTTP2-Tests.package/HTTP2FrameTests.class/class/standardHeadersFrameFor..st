standard values
standardHeadersFrameFor: aHeaderBlock
	^ (HTTP2HeadersFrame new)
				payload: aHeaderBlock;
				streamIdentifier: 5;
				yourself