tests - at put
testAtPut
	"self debug: #testAtPut"
	
	self nonEmpty at: self anIndex putAll: self aValue.
	self assert: (self nonEmpty at: self anIndex) = self aValue.
	