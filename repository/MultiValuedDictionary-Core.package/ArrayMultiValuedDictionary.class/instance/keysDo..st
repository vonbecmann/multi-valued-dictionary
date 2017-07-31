enumerating
keysDo: aBlock
	"Evaluate aBlock for each of the receiver's keys."

	dictionary associationsDo: [ :association | aBlock value: association key ]