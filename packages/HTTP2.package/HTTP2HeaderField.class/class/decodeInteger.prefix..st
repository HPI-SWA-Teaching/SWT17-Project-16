as yet unclassified
decodeInteger: aStream prefix: aPrefix
	| value exp |
	value := aStream next bitAnd: (2 raisedTo: aPrefix) - 1.
	value < ((2 raisedTo: aPrefix) - 1)
		ifTrue: [^ value]
		ifFalse: [
			value := value + (aStream next bitAnd: 127).
			exp := 7.
			[(aStream peek bitAt: 7) = 1] whileTrue: [
				value := value + ((aStream next bitAnd: 127) * (2 raisedTo: exp)).
				exp := exp + 7.].
			^ (value + ((aStream next bitAnd: 127) * (2 raisedTo: exp)))]