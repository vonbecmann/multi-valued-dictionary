enumerating
collect: collectBlock thenReject: rejectBlock
	"Utility method to improve readability."

	"Uses do: for performance and to be sure that it is a collectionClass.
	 Optimized for efficiency. "

	| newCollection |
	newCollection := self copyEmpty.
	self
		associationsDo: [ :association | 
			| newValues |
			newValues := collectionClass new.
			association value
				do: [ :eachValue | 
					| newValue |
					newValue := collectBlock value: eachValue.
					(rejectBlock value: newValue)
						ifFalse: [ newValues add: newValue ] ].
			newValues isEmpty
				ifFalse: [ newCollection privateAt: association key put: newValues ] ].
	^ newCollection