enumerating
collect: collectBlock thenDo: doBlock
	"Utility method to improve readability."

	dictionary
		associationsDo: [ :association | association value collect: collectBlock thenDo: doBlock ]