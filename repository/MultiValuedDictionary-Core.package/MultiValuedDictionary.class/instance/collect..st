enumerating
collect: aBlock
	"Evaluate aBlock with each of my values as the argument.  Collect the
	resulting values into a collection that is like me. Answer with the new
	collection."

	"Uses do: for performance and to be sure that it is a collectionClass."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			collectionClass == association value class
				ifTrue: [ | newValues |
					newValues := collectionClass new.
					association value do: [ :eachValue | newValues add: (aBlock value: eachValue) ].
					newValues isEmpty
						ifFalse: [ newCollection privateAt: association key put: newValues ] ]
				ifFalse: [ newCollection privateAt: association key put: (aBlock value: association value) ] ].
	^ newCollection