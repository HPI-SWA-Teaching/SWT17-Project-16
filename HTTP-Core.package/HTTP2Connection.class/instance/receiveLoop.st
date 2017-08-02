receiving
receiveLoop
	[self connectionActive and: self socketStream atEnd not] whileTrue: [
		self receive.
		(Delay forMilliseconds: 1) wait]
	"[self socketStream atEnd not] whileTrue: [
		self socketStream isEmpty not ifTrue: [
			length := (self socketStream peek: 3) asByteArray asInteger.
			aFrame := HTTP2Frame getFrameFrom: (self socketStream next: length + 9) asByteArray.
			Transcript show: aFrame; show: '', Character cr, Character lf.
			aFrame class = HTTP2DataFrame ifTrue: [
				Transcript show: aFrame payload; show: '',Character cr, Character lf.
				].
			].
		(Delay forMilliseconds:  20) wait.]."