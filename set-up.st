
Gofer it
  url: 'filetree:///home/vonbecmann/workspaces/crappy-code/repository';
  package: 'CC-Home';
  load.

GTPlayBook
   stashDirectory: '/home/vonbecmann/workspaces/multi-valued-dictionary/stash-cache/' asFileReference.

Metacello new
    baseline: 'MultiValuedDictionary';
    repository: 'filetree:///home/vonbecmann/workspaces/multi-valued-dictionary/repository';
    load.


Smalltalk snapshot: true andQuit: true.

