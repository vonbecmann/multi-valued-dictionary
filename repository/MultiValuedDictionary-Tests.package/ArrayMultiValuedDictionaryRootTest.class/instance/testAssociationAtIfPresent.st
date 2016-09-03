tests - dictionary assocition access
testAssociationAtIfPresent
	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn.

	self assert: result key = keyIn.
	self assert: result value = (collection at: keyIn).
	self assert: (collection associationAt: keyIn ifPresent: [ :assoc | assoc ]) equals: result.
	self assert: (collection associationAt: self keyNotIn ifPresent: [ :assoc | assoc ]) isNil