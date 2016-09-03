tests - DictionaryIndexAccessing
testAtPutDict
	"self run: #testAtPutDict"
	"self debug: #testAtPutDict"
	
	| adictionary keyIn |
	adictionary := self nonEmpty .
	keyIn := adictionary keys anyOne.
	
	adictionary at: keyIn put: 'new'.
	self assert: ((adictionary at: keyIn ) includes: 'new').
	
	adictionary at: keyIn  put: 'newnew'.
	self assert: ((adictionary at: keyIn ) includes: 'newnew').
	
	adictionary at: self keyNotIn  put: 666.
	self assert: ((adictionary at: self keyNotIn) includes: 666).