initialization
initializeWidgets
	| tabItem |
	channelTabs := self instantiate: TabManagerModel.
	serverLog := IRCBasicInput new.
	tabItem := TabModel new.
	tabItem
		label: 'No Connection';
		contents: serverLog buildWithSpec.
	
	
