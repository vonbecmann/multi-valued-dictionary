enumerating
associationsSelect: aBlock
	"Evaluate aBlock with each of my associations as the argument. Collect
	into a new dictionary, only those associations for which aBlock evaluates
	to true."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary
		associationsDo: [ :association | 
			| newValues |
			newValues := collectionClass new.
			association value
				do: [ :eachValue | 
					(aBlock value: association key -> eachValue)
						ifTrue: [ newValues add: eachValue ] ].
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection