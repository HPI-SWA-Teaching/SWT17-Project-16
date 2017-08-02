receiving
updateSettings: parameterList
	parameterList do: [:parameter | 
		self streamManager perform:
			('update', parameter key,':') asSymbol withArguments: (Array with: parameter value)]