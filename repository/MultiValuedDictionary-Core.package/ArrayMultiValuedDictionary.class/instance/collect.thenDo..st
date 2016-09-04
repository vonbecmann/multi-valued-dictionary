enumerating
collect: collectBlock thenDo: doBlock
	"Utility method to improve readability."

	self valuesDo: [ :each | doBlock value: (collectBlock value: each) ]