tests - Dictionary keys values associations access
testKeys
	| collection result |
	collection := self nonEmpty.
	result := collection keys.
	result do: [ :key | collection at: key ].
	"self assert: result size = collection size. <- not true anymore in a multi dictionary"
	self should: [ result detect: [ :each | (result occurrencesOf: each) > 1 ] ] raise: Error