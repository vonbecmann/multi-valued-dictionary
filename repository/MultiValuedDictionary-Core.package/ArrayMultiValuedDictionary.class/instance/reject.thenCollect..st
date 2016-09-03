enumerating
reject: rejectBlock thenCollect: collectBlock
	"Utility method to improve readability."

	"Optimized for efficiency."

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			| newValues |
			newValues := association value reject: rejectBlock thenCollect: collectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection