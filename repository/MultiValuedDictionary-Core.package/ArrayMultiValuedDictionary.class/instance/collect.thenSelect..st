enumerating
collect: collectBlock thenSelect: selectBlock
	"Utility method to improve readability."

	"Optimized for efficiency. "

	| newCollection |
	newCollection := self copyEmpty.
	dictionary 
		associationsDo: [ :association | 
			| newValues |
			newValues := association value collect: collectBlock thenSelect: selectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection