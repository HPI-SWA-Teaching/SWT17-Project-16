accessing
asOrderedCollection 
	| collection |
	collection := OrderedCollection new.
	self dictionary associationsDo: [:ass|collection add: ass].
	^ collection