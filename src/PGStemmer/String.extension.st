Extension { #name : #String }

{ #category : #'*PGStemmer' }
String >> stemFrom: aPGPorterStemmer [ 
	" See comment in #stemOf: "

	^ aPGPorterStemmer performStemmingFromString: self.

]
