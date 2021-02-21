Extension { #name : #String }

{ #category : #'*PGTF-IDF' }
String >> tokenize [
	" Answer a <Collection> of <String> each one representing the receiver's tokens "

	^ PGWordTokenizer new tokenize: self
]

{ #category : #'*PGTF-IDF' }
String >> tokenizeWithoutStopwords [
	" Answer a <Collection> of <String> each one representing the receiver's tokens without stopwords "
	
	^ self tokenize removeStopwordsUsing: AIStopwords forEnglish
]
