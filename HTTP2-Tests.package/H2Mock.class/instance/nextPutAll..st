as yet unclassified
nextPutAll: aCollection
	|aFittingCollection|
	aCollection class = self streamSpecies  ifTrue:
	[
		aFittingCollection := aCollection
	].
	aCollection class = self streamSpecies ifFalse:
	[
		self streamSpecies = ByteArray ifTrue:
		[aFittingCollection := aCollection asByteArray].
		self streamSpecies = ByteString ifTrue:
		[aFittingCollection := aCollection asString]
				
														].
	^self outStream nextPutAll: aFittingCollection