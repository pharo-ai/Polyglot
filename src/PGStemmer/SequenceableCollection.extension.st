Extension { #name : #SequenceableCollection }

{ #category : #'*PGStemmer' }
SequenceableCollection >> stemFrom: aPGPorterStemmer [ 
	" See comment in #stemOf: "

	^ aPGPorterStemmer performStemmingFromSequenceableCollection: self.

]

{ #category : #'*PGStemmer' }
SequenceableCollection >> stemUsingPorter [
	" Answer a <Collection> of stemmed terms using the Porter algorithm "

	^ self collect: [ : obj | PGPorterStemmer stemOf: obj ]
]
