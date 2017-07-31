enumerating
collect: aBlock
	"Evaluate aBlock with each of my values as the argument.  Collect the
	resulting values into a collection that is like me. Answer with the new
	collection."

	| newCollection |
	newCollection := self copyEmpty.
	dictionary 
		associationsDo: [ :association | 
			| newValues |
			newValues := association value collect: aBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection