Extension { #name : #String }

{ #category : #'*PGTokenizer' }
String >> removeSpecialArtifacts [

	^ self removeSpecialArtifactsUsing: PGWordTokenizer new specialArtifacts
]

{ #category : #'*PGTokenizer' }
String >> removeSpecialArtifactsUsing: artifactsCollection [

	^ (self findBetweenSubstrings: artifactsCollection) joinUsing: ' '
]

{ #category : #'*PGTokenizer' }
String >> tokenizeWithoutStopwords [
	" Answer a <Collection> of <String> each one representing the receiver's tokens without stopwords "
	
	^ self tokenize 
		removeStopwordsUsing: AIStopwords forEnglish
]
