# Pharo IRC #
** NOTE: Still  a work in progress! *Please* submit any issues via this repository on Github! **
  
I am a full RFC 2812 compliant implementation of an IRC client.
  
My reference version is the excellently designed [squIRC](https://github.com/hpi-swa-teaching/squIRC). Any design decisions that seem strange, ridiculous, idiotic, or even downright irresponsible in this repository are very likely my own.
  
## Installing ##
(So far this has only been tested with Pharo 6.1)
  
To easily install everything with Metacello:
```smalltalk
Metacello new
    baseline: 'PharoIRC';
    repository: 'github://darth-cheney/pharo-irc';
    load.
```
  
## Opening a Connection with the basic UI ##
Here is an example of how to open a connection with the included basic gui.
  
```smalltalk
| connection display |
connection := IRCConnection new.
connection
    nickname: 'pharo-user';
    hostname: 'irc.freenode.net'.
display := IRCBasicDisplay connection: connection.
display openWithSpec.
connection connect.
```
## IRCBasicDisplay commands ##
The commands should be like normal IRC clients, though not everything has been implemented yet.
  
For example, use this to join a channel:
`/join #testChannel`
  
Or this to change your nick:
`/nick new-name`
  
## Design Docs and More Coming Soon ##
