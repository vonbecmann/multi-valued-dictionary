tests
testAtIfPresentIfAbsent
	"Test at:ifPresent:ifAbsent:"

	"to move to the corresponding trait?"

	| dict present absent |
	dict := self newEmptyDict.
	present := absent := false.
	dict at: #foo ifPresent: [ :v | present := true ] ifAbsent: [ absent := true ].
	self deny: present.
	self assert: absent.

	dict at: #foo put: #bar.
	present := absent := false.
	dict at: #foo ifPresent: [ :v | present := true ] ifAbsent: [ absent := true ].
	self assert: present.
	self deny: absent.

	present := absent := false.
	dict
		at: #foo
		ifPresent: [ :v | present := true. nil ]
		ifAbsent: [ absent := true ].
	self assert: present.
	self deny: absent