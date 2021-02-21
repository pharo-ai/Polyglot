Extension { #name : #Character }

{ #category : #'*PGStemmer' }
Character >> stemFrom: aPGPorterStemmer [ 
	" See comment in #stemOf: "

	^ aPGPorterStemmer performStemmingFromCharacter: self.
]
