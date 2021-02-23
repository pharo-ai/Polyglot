Extension { #name : #SequenceableCollection }

{ #category : #'*PGTokenizer' }
SequenceableCollection >> tokenizeWithoutStopwords [
	" Answer a <Collection> of <String> each one representing the receiver's tokens without stopwords "

	^ self collectDisplayingProgress: #tokenizeWithoutStopwords.

]
