enumerating
valuesDo: aBlock
	"Evaluate aBlock for each of the receiver's values."

	self
		associationsDo: [ :association | 
			collectionClass == association value class
				ifTrue: [ association value do: [ :eachValue | aBlock value: eachValue ] ]
				ifFalse: [ aBlock value: association value ] ]