accessing
streamDependency
	^ streamDependency ifNil: [ 
		self streamDependency: 0. 
		^ 0]