Extension { #name : #SequenceableCollection }

{ #category : #'*PGStemmer' }
SequenceableCollection >> stemFrom: aPGPorterStemmer [ 
	" See comment in #stemOf: "

	^ aPGPorterStemmer performStemmingFromSequenceableCollection: self.

]
