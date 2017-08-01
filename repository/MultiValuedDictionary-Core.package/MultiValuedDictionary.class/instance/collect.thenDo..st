enumerating
collect: collectBlock thenDo: doBlock
	"Utility method to improve readability."

	dictionary
		associationsDo: [ :association | 
			association value
				do: [ :eachValue | doBlock value: (collectBlock value: eachValue) ] ]