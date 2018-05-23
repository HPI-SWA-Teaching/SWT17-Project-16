*HTTP2-Core
alpnProtos: aProtocolSet
	| len bytes i |
	len := 0.
	aProtocolSet do: [ :x | len := len + 1 + x size ].
	bytes := ByteArray new: len.
	i := 1.
	aProtocolSet do: [ :x |
		bytes at: i put: x size. 1 to: (x size) do:
			[ :j | | val |
				val := x asByteArray at: j.
				bytes at: i+j put: val ].
		i := i + 1 + x size ].
	^ self primitiveSSL: handle setStringProperty: 3 toValue: bytes asString.