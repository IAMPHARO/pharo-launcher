as yet unclassified
fetchOnlineImage: anURL 

	| list |
	list := OrderedCollection new.
	(FileList new directory: self url) fileList do: [ :each | 
			list add: (ImageLauncherElement
				name: (each path asZnUrl lastPathSegment) 
				url: (each path asZnUrl pathPrintString )
				category: 'Existing')
		].
	^list