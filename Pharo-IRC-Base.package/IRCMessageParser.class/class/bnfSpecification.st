as yet unclassified
bnfSpecification
	"Returns the section of RFC 2812 that deals
	 with message format in ABNF. This method is
	 inspired by squIRC".
	^ '   The protocol messages must be extracted from the contiguous stream of
   octets.  The current solution is to designate two characters, CR and
   LF, as message separators.  Empty messages are silently ignored,
   which permits use of the sequence CR-LF between messages without
   extra problems.

   The extracted message is parsed into the components <prefix>,
   <command> and list of parameters (<params>).

    The Augmented BNF representation for this is:

    message    =  [ ":" prefix SPACE ] command [ params ] crlf
    prefix     =  servername / ( nickname [ [ "!" user ] "@" host ] )
    command    =  1*letter / 3digit
    params     =  *14( SPACE middle ) [ SPACE ":" trailing ]
               =/ 14( SPACE middle ) [ SPACE [ ":" ] trailing ]

    nospcrlfcl =  %x01-09 / %x0B-0C / %x0E-1F / %x21-39 / %x3B-FF
                    ; any octet except NUL, CR, LF, " " and ":"
    middle     =  nospcrlfcl *( ":" / nospcrlfcl )
    trailing   =  *( ":" / " " / nospcrlfcl )

    SPACE      =  %x20        ; space character
    crlf       =  %x0D %x0A   ; "carriage return" "linefeed"

   NOTES:
      1) After extracting the parameter list, all parameters are equal
         whether matched by <middle> or <trailing>. <trailing> is just a
         syntactic trick to allow SPACE within the parameter.

      2) The NUL (%x00) character is not special in message framing, and
         basically could end up inside a parameter, but it would cause
         extra complexities in normal C string handling. Therefore, NUL
         is not allowed within messages.

   Most protocol messages specify additional semantics and syntax for
   the extracted parameter strings dictated by their position in the
   list.  For example, many server commands will assume that the first
   parameter after the command is the list of targets, which can be
   described with:

  target     =  nickname / server
  msgtarget  =  msgto *( "," msgto )
  msgto      =  channel / ( user [ "%" host ] "@" servername )
  msgto      =/ ( user "%" host ) / targetmask
  msgto      =/ nickname / ( nickname "!" user "@" host )
  channel    =  ( "#" / "+" / ( "!" channelid ) / "&" ) chanstring
                [ ":" chanstring ]
  servername =  hostname
  host       =  hostname / hostaddr
  hostname   =  shortname *( "." shortname )
  shortname  =  ( letter / digit ) *( letter / digit / "-" )
                *( letter / digit )
                  ; as specified in RFC 1123 [HNAME]
  hostaddr   =  ip4addr / ip6addr
  ip4addr    =  1*3digit "." 1*3digit "." 1*3digit "." 1*3digit
  ip6addr    =  1*hexdigit 7( ":" 1*hexdigit )
  ip6addr    =/ "0:0:0:0:0:" ( "0" / "FFFF" ) ":" ip4addr
  nickname   =  ( letter / special ) *8( letter / digit / special / "-" )
  targetmask =  ( "$" / "#" ) mask
                  ; see details on allowed masks in section 3.3.1
  chanstring =  %x01-07 / %x08-09 / %x0B-0C / %x0E-1F / %x21-2B
  chanstring =/ %x2D-39 / %x3B-FF
                  ; any octet except NUL, BELL, CR, LF, " ", "," and ":"
  channelid  = 5( %x41-5A / digit )   ; 5( A-Z / 0-9 )

  Other parameter syntaxes are:

  user       =  1*( %x01-09 / %x0B-0C / %x0E-1F / %x21-3F / %x41-FF )
                  ; any octet except NUL, CR, LF, " " and "@"
  key        =  1*23( %x01-05 / %x07-08 / %x0C / %x0E-1F / %x21-7F )
                  ; any 7-bit US_ASCII character,
                  ; except NUL, CR, LF, FF, h/v TABs, and " "
  letter     =  %x41-5A / %x61-7A       ; A-Z / a-z
  digit      =  %x30-39                 ; 0-9
  hexdigit   =  digit / "A" / "B" / "C" / "D" / "E" / "F"
  special    =  %x5B-60 / %x7B-7D
                   ; "[", "]", "\", "`", "_", "^", "{", "|", "}"

  NOTES:
      1) The <hostaddr> syntax is given here for the sole purpose of
         indicating the format to follow for IP addresses.  This
         reflects the fact that the only available implementations of
         this protocol uses TCP/IP as underlying network protocol but is
         not meant to prevent other protocols to be used.

      2) <hostname> has a maximum length of 63 characters.  This is a
         limitation of the protocol as internet hostnames (in
         particular) can be longer.  Such restriction is necessary
         because IRC messages are limited to 512 characters in length.
         Clients connecting from a host which name is longer than 63
         characters are registered using the host (numeric) address
         instead of the host name.

      3) Some parameters used in the following sections of this
         documents are not defined here as there is nothing specific
         about them besides the name that is used for convenience.
         These parameters follow the general syntax defined for
         <params>.'.