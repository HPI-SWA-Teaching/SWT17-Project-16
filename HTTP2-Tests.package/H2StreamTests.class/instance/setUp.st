running
setUp
	
	stream := H2Stream new: 5 for: H2Request new connection: H2Connection new.
	indexTable := H2HPACKIndexTable new