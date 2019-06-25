Extension { #name : #TAssertable }

{ #category : #'*PGNgram-Pharo6' }
TAssertable >> deny: actual equals: expected [
	^ self
		deny: expected = actual
		description: [self unexpectedEqualityStringBetween: actual and: expected]
]

{ #category : #'*PGNgram-Pharo6' }
TAssertable >> unexpectedEqualityStringBetween: actual and: expected [

	^ String streamContents: [:stream |
			stream
				nextPutAll: 'Unexpected equality of ';
				nextPutAll: actual fullPrintString;
				nextPutAll: ' and ';
				nextPutAll: expected fullPrintString;
				nextPutAll: '.']
]
