as yet unclassified
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			spec
				package: 'HTTP2';
				yourself.
			spec
				group: 'default' with: #('HTTP2')];
			yourself