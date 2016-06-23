enumerating
collect: aBlock
	"Evaluate aBlock with each of my values as the argument.  Collect the
	resulting values into a collection that is like me. Answer with the new
	collection."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			association value isCollection
				ifTrue: [ 
					| newValues |
					newValues := collectionClass new.
					association value do: [ :eachValue | newValues add: (aBlock value: eachValue) ].
					newValues isEmpty
						ifFalse: [ newCollection basicprivateAt: association key put: newValues ] ]
				ifFalse: [ newCollection basicprivateAt: association key put: (aBlock value: association value) ] ].
	^ newCollection