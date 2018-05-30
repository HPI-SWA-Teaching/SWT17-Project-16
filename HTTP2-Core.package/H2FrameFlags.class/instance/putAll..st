accessing
putAll: anInteger
	1 to: flagStorage capacity do: [:bitPosition |
		self at: bitPosition put: (anInteger bitAt: bitPosition)]