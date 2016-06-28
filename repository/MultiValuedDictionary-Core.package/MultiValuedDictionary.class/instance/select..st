enumerating
select: aBlock
	"Evaluate aBlock with each of my values as the argument. Collect into a new dictionary, only those associations for which aBlock evaluates to true."

	"Uses do: for performance and to be sure that it is a collectionClass."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			collectionClass == association value class
				ifTrue: [ | newValues |
					newValues := collectionClass new.
					association value
						do: [ :eachValue | (aBlock value: eachValue) ifTrue: [ newValues add: eachValue ] ].
					newValues isEmpty
						ifFalse: [ newCollection privateAt: association key put: newValues ] ]
				ifFalse: [ 
					(aBlock value: association value)
						ifTrue: [ newCollection privateAt: association key put: association value ] ] ].
	^ newCollection