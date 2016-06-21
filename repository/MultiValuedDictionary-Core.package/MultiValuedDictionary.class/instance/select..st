enumerating
select: aBlock
	"Evaluate aBlock with each of my values as the argument. Collect into a new dictionary, only those associations for which aBlock evaluates to true."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :eachAssociation | 
			| newValues |
			newValues := eachAssociation value select: [ :eachValue | aBlock value: eachValue ].
			newValues isEmpty
				ifFalse: [ newCollection at: eachAssociation key putAll: newValues ] ].
	^ newCollection