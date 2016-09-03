enumerating
valuesDo: aBlock
	"Evaluate aBlock for each of the receiver's values."

	self associationsDo: [ :association | association value do: [ :eachValue | aBlock value: eachValue ] ]