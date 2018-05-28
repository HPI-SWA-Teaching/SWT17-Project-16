receiving
nextLength
	^ Integer from: (self socketStream peek: 3) asByteArray