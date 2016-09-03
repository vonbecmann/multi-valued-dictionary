printing
printNameOn: aStream
	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name