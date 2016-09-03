enumerating
collect: collectBlock thenReject: rejectBlock
	"Utility method to improve readability."

	"Optimized for efficiency. "

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			| newValues |
			newValues := association value collect: collectBlock thenReject: rejectBlock.
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection