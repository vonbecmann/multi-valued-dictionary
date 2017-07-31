enumerating
associationsDo: aBlock
	"Evaluate aBlock for each of the receiver's elements (key/value 
	associations)."

	dictionary
		associationsDo:
			[ :association | 
				association value do: [ :eachValue | aBlock value: association key -> eachValue ] ]