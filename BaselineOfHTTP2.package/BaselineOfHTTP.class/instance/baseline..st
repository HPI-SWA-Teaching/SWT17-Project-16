baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			spec
				package: 'HTTP2-Core';
				package: 'HTTP2-Tests' with: [spec requires: #('default')];
				yourself.
			spec
				group: 'default' with: #('HTTP2-Core');
				group: 'tests' with: #('HTTP2-Tests')];
			yourself