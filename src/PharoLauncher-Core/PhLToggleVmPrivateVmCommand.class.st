"
Toggle between display of VMs used to launch Pharo images and ""private"" VMs used to determine Pharo version of an image (one VM per image format)
"
Class {
	#name : #PhLToggleVmPrivateVmCommand,
	#superclass : #PhLVmCommand,
	#category : #'PharoLauncher-Core-Commands'
}

{ #category : #converting }
PhLToggleVmPrivateVmCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #remote;
		beDisplayedOnRightSide;
		configureAsToolBarToggleButton;
		yourself
]

{ #category : #executing }
PhLToggleVmPrivateVmCommand >> execute [
	self vmsPresenter toggleShowVmPrivateVm.
]

{ #category : #initialization }
PhLToggleVmPrivateVmCommand >> initialize [
	super initialize.
	self name: 'public'
]
