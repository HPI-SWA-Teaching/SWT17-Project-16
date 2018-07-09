private
headerAssociationsFrom: aWebMessage
	"workaround, because the headers field (OrderedCollection) in WebMessage has no getter"
	"@WebMessage-devs please use a map and don't implement it yourself :("
	| collection |
	collection := OrderedCollection new.
	aWebMessage headersDo: [:key :value | collection add:
		(key asLowercase -> value asString)].
	^ collection