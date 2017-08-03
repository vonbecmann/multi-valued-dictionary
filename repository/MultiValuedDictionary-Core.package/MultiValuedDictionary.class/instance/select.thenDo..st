enumerating
select: selectBlock thenDo: doBlock
	"Utility method to improve readability.
	Do not create the intermediate collection."

	dictionary
		associationsDo: [ :association | association value select: selectBlock thenDo: doBlock ]