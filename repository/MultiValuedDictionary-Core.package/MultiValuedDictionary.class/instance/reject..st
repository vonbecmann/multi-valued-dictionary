enumerating
reject: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver only those elements for 
	which aBlock evaluates to false. Answer the new collection."

	"Uses do: for performance and to be sure that it is a collectionClass."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary
		associationsDo: [ :association | 
			| newValues |
			newValues := collectionClass new.
			association value
				do: [ :eachValue | 
					(aBlock value: eachValue)
						ifFalse: [ newValues add: eachValue ] ].
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection