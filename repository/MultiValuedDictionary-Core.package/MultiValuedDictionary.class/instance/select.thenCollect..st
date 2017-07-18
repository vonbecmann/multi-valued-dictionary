enumerating
select: selectBlock thenCollect: collectBlock
	"Utility method to improve readability."
	"Uses do: for performance and to be sure that it is a collectionClass.
	 Optimized for efficiency."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary
		associationsDo: [ :association | 
			| newValues |
			newValues := collectionClass new.
			association value
				do: [ :eachValue | 
					(selectBlock value: eachValue)
						ifTrue: [ newValues add: (collectBlock value: eachValue) ] ].
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection