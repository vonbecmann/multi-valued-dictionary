enumerating
reject: rejectBlock thenDo: doBlock
	"Utility method to improve readability."

	"Do not create the intermediate collection.
	 Optimized for efficiency."

	dictionary
		associationsDo: [ :association | 
			association value
				do: [ :eachValue | 
					(rejectBlock value: eachValue)
						ifFalse: [ doBlock value: eachValue ] ] ]