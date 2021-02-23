Class {
	#name : #BaselineOfPolyglot,
	#superclass : #BaselineOf,
	#category : #BaselineOfPolyglot
}

{ #category : #baselines }
BaselineOfPolyglot >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"External dependencies"
		spec
			baseline: 'AIStopwords'
			with: [ spec repository: 'github://pharo-ai/stopwords/src' ].
			
		"Packages"
		spec 
			package: 'PGTokenizer';					with: [ spec requires: #('AIStopwords') ];
			package: 'PGTokenizer-Tests' 			with: [ spec requires: #('PGTokenizer') ];
			package: 'PGNgram';
			package: 'PGNgram-Tests' 				with: [ spec requires: #('PGNgram') ];
			package: 'PGTF-IDF';
			package: 'PGTF-IDF-Tests'				with: [ spec requires: #('PGTF-IDF') ];
			package: 'PGLanguageModel';
			package: 'PGLanguageModel-Tests' 		with: [ spec requires: #('PGLanguageModel') ];
			package: 'PGAtlasBridge';
			package: 'PGNamedEntityRecognizer' 	with: [ spec requires: #('PGAtlasBridge') ];
			package: 'PGDependencyParser' 			with: [ spec requires: #('PGAtlasBridge') ];
			package: 'PGStemmer';
			package: 'PGStemmer-Tests' 				with: [ spec requires: #('PGStemmer') ];
			package: 'PGModels';
			package: 'PGMetrics';
			package: 'PGMetrics-Tests' 				with: [ spec requires: #('PGMetrics') ];
			package: 'PGPosTagger' 					with: [ spec requires: #('PGAtlasBridge' 'PGModels') ];
			package: 'PGPosTaggerTests' 			with: [ spec requires: #('PGPosTagger') ]. 
			
		spec for: #'pharo6.x' do: [
			spec package: 'PGNgram-Pharo6' ]
			
			].
]
