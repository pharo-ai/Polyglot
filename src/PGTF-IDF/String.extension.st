Extension { #name : #String }

{ #category : #'*PGTF-IDF' }
String >> tokenize [
	" Answer a <Collection> of <String> each one representing the receiver's tokens "

	^ PGWordTokenizer new 
		tokenize: self
]
