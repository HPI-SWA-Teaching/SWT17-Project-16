baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [
			spec
				package: 'HTTP-Core';
				package: 'HTTP-Tests' with: [spec requires: #('default')];
				yourself.
			spec
				group: 'default' with: #('HTTP-Core');
				group: 'tests' with: #('HTTP-Tests')];
			yourself