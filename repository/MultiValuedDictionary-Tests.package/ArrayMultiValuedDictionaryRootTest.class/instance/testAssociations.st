tests - Dictionary keys values associations access
testAssociations

	| collection result  |
	collection := self nonEmpty .
	result := collection associations.
	
	self assert: result size = collection size.
	result do: [:assoc | self assert: ((collection at: assoc key) includes: assoc value) ].
	"keys do: [ :key | self assert: ( result at: key ) = ( collection at: key )] ."
	