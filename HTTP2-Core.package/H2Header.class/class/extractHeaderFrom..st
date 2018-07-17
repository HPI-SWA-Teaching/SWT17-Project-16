instance creation
extractHeaderFrom: aWebMessage
	| collection |
	collection := OrderedCollection new.
	aWebMessage headersDo: [:key :value |
		collection add: (key asLowercase -> value asString)].
	^ collection