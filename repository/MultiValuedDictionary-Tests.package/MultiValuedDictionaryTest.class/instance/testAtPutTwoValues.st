tests - at put
testAtPutTwoValues
	"self debug: #testAtPutTwoValues"
	
	self nonEmpty at: self anIndex putAll: self aValue.
	self nonEmpty at: self anIndex putAll: self anotherValue.
	self assert: (self nonEmpty at: self anIndex) = self anotherValue.