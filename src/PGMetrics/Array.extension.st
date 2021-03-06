Extension { #name : #Array }

{ #category : #'*PGMetrics' }
Array >> cosineSimilarity: anArray [
	|num size1 size2|
	num := (self * anArray) sum.
	size1 := (self * self) sum sqrt.
	size2 := (anArray * anArray ) sum sqrt.
	
	^ num/(size1*size2)
]

{ #category : #'*PGMetrics' }
Array >> elementwiseProd: anArray [
	^ self * anArray 
]

{ #category : #'*PGMetrics' }
Array >> euclideanDistance: anArray [
	^((self - anArray) raisedTo: 2) sum sqrt.
]

{ #category : #'*PGMetrics' }
Array >> manhattanDistance: anArray [
	^(self - anArray) abs sum. 
]
