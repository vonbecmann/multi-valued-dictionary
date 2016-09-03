tests - dictionary key access
testKeyAtIdentityValue
	
	
	| dict value result |
	dict := self nonEmpty .
	value := dict values anyOne.
	
	result := dict keyAtIdentityValue: value.
	self assert: ((dict at: result) includes: value).
		
	self should: [dict keyAtIdentityValue: self valueNotIn ] raise: Error
	
	