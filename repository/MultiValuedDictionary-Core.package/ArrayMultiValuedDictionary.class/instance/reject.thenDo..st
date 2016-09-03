enumerating
reject: rejectBlock thenDo: doBlock
	"Utility method to improve readability."

	"Do not create the intermediate collection.
	 Optimized for efficiency."

	self
		do: [ :each | 
			(rejectBlock value: each)
				ifFalse: [ doBlock value: each ] ]