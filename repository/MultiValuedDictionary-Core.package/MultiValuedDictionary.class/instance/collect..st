enumerating
collect: aBlock
	"Evaluate aBlock with each of my values as the argument.  Collect the
	resulting values into a collection that is like me. Answer with the new
	collection."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :eachAssociation | 
			| newValues |
			newValues := eachAssociation value collect: [ :eachValue | aBlock value: eachValue ].
			newValues isEmpty
				ifFalse: [ newCollection at: eachAssociation key putAll: newValues ] ].
	^ newCollection