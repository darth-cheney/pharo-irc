# Pharo IRC #
** NOTE: Still  a work in progress! *Please* submit any issues via this repository on Github! **
  
I am a full RFC 2812 compliant implementation of an IRC client.
  
My reference version is the excellently designed [https://github.com/hpi-swa-teaching/squIRC](squIRC). Any design decisions that seem strange, ridiculous, idiotic, or even downright responsible in this repository are very likely my own.
  
## Installing ##
(So far this has only been tested with Pharo 6.1)
  
Because I cannot, for the life of be, get `ConfigurationOfPharoIRC` to load properly via Metacello, you simply have to clone this branch in Iceberg and load in the packages one at a time.  Sorry!
  
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
