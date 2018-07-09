helper
part: i of: n from: aByteArray
	| length partSize min max |
	
	length := aByteArray size.
	partSize := (length / n) ceiling.
	min := i * partSize.
	max := (i + 1) * partSize.
	^ aByteArray copyFrom: min + 1 to: (max min: length)