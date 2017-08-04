instance creation
newFrom: aHeaderBlock in: aContext
	| stream header |
	stream := ReadStream on: aHeaderBlock.
	header := self new.
	[stream atEnd] whileFalse: [
		header add: (H2HeaderField newFrom: stream in: aContext)].
	^ header