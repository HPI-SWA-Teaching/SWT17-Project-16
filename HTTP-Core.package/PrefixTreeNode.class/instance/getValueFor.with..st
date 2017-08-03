accessing
getValueFor: searchString with: ANDDecisionString
	^ (self getNodeFor: searchString with: ANDDecisionString) getValueFor: searchString with: (ANDDecisionString >> 1)