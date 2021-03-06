Class {
	#name : #AbstractAutotestTestLongRun,
	#superclass : #AbstractAutotestTestCase,
	#instVars : [
		'showTestResultCalled',
		'givenResult',
		'showTestResultCallCount',
		'autotest',
		'showMethodModifiedCalled'
	],
	#category : #'Autotest-Tests-Core'
}

{ #category : #'as yet unclassified' }
AbstractAutotestTestLongRun class >> isAbstract [ 
	^ self name = #AbstractAutotestTestLongRun
]

{ #category : #convenience }
AbstractAutotestTestLongRun >> incShowTestResultCallCount [ 
	showTestResultCallCount := self showTestResultCallCount + 1.
]

{ #category : #setup }
AbstractAutotestTestLongRun >> setUp [
	"self assert: Autotest allInstances isEmpty."
	autotest := Autotest view: self.
	showMethodModifiedCalled := false.
]

{ #category : #callbacks }
AbstractAutotestTestLongRun >> showMethodModified: aCompiledMethod [ 
	showMethodModifiedCalled := true.
]

{ #category : #callbacks }
AbstractAutotestTestLongRun >> showTestResult: aTestResult OfMethod: aCompiledMethod [ 
	self incShowTestResultCallCount.
	givenResult := aTestResult.
]

{ #category : #accessing }
AbstractAutotestTestLongRun >> showTestResultCallCount [ 
	^ showTestResultCallCount ifNil: [showTestResultCallCount := 0].
]

{ #category : #setup }
AbstractAutotestTestLongRun >> tearDown [
	autotest := nil.
	(Delay forMilliseconds: 200) wait.
	super tearDown.
]
