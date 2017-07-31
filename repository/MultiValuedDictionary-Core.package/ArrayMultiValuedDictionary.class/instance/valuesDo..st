enumerating
valuesDo: aBlock
	"Evaluate aBlock for each of the receiver's values."

	dictionary associationsDo: [ :association | association value do: [ :eachValue | aBlock value: eachValue ] ]