receiving
updateSettings: parameterList
	parameterList do: [:parameter | 
		self connection perform:
			('update', parameter key,':') asSymbol withArguments: (Array with: parameter value)]