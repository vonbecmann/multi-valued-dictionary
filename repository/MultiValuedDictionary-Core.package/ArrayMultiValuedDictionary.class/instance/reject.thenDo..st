enumerating
reject: rejectBlock thenDo: doBlock
	"Utility method to improve readability."

	"Do not create the intermediate collection.
	 Optimized for efficiency."

	self
		valuesDo: [ :each | 
			(rejectBlock value: each)
				ifFalse: [ doBlock value: each ] ]