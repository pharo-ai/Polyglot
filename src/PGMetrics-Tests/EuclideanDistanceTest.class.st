Class {
	#name : #EuclideanDistanceTest,
	#superclass : #TestCase,
	#category : #'PGMetrics-Tests'
}

{ #category : #tests }
EuclideanDistanceTest >> testCosineSimilarity [
	| result actual |
	
	result := #(0 3 4 5) euclideanDistance: #(7 6 3 -1).
	actual := 9.74679434481.
	self assert: (result closeTo: actual). 
]
