enumerating
select: selectBlock thenCollect: collectBlock
	"Utility method to improve readability."

	"Optimized for efficiency."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			| newValues |
			newValues := association value select: selectBlock thenCollect: collectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection