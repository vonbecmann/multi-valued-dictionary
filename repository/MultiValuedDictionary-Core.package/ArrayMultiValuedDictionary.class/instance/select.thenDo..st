enumerating
select: selectBlock thenDo: doBlock
	"Utility method to improve readability.
	Do not create the intermediate collection."

	self
		valuesDo: [ :each | 
			(selectBlock value: each)
				ifTrue: [ doBlock value: each ] ]