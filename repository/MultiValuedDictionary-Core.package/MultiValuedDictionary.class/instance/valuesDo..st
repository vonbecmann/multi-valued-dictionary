enumerating
valuesDo: aBlock
	"Evaluate aBlock for each of the receiver's values."

	self
		associationsDo:
			[ :eachAssociation | eachAssociation value do: [ :eachValue | aBlock value: eachValue ] ]