*HTTP2-Core
alpnProtosEncode: aProtocolSet
	| length bytes i |
	length := 0.
	aProtocolSet do: [ :protocol | length := length + 1 + protocol size ].
	
	bytes := ByteArray new: length.
	i := 1.
	aProtocolSet do: [ :protocol |
		bytes at: i put: protocol size.
		1 to: (protocol size) do: [ :j | bytes at: i+j put: (protocol asByteArray at: j) ].
		i := i + 1 + protocol size ].
	
	^ bytes asString.