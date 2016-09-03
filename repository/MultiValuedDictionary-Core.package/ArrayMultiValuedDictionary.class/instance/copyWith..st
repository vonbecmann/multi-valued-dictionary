copying
copyWith: newElement
	"Answer a new collection with newElement added."

	^ self copy
		add: newElement;
		yourself