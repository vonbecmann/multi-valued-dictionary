enumerating
select: aBlock
	"Evaluate aBlock with each of my values as the argument. Collect into a new dictionary, only those associations for which aBlock evaluates to true."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			association value isCollection
				ifTrue: [ | newValues |
					newValues := collectionClass new.
					association value
						do: [ :eachValue | 
							(aBlock value: eachValue)
								ifTrue: [ newValues add: eachValue ] ].
					newValues isEmpty
						ifFalse: [ newCollection basicprivateAt: association key put: newValues ] ]
				ifFalse: [ 
					(aBlock value: association value)
						ifTrue: [ newCollection basicprivateAt: association key put: association value ] ] ].
	^ newCollection