worm
====

-------------------------------------------------
- README file for Worm -
- Last changes: 2013-06-18                      -
-------------------------------------------------

Description
-----------
  Worm is an gem wrapping Frank console. It is a way to use irb to inspect the accessible elements of an iOS app, but if you really want to have fun, use it to drive your iOS application. 

Further README contents
-----------------------
  1. Installation and setup
  2. Example Commands
  3. Contribute
 
1. Installation and Setup
-------------------------

- gem install worm

Since worm is merely a Frank wrapper you must have a Frankified app to drive. After issuing the Frank commands 'frank build' and 'frank launch' to launch you iOS application in the iOS simulator, open the terminal and start irb. 

Type:

require 'worm'

worm = Worm.new

2. Example Commands
------------------------

worm.buttons #returns a list of all the buttons on the current screen accessible by accessibilityLabel

worm.labels #returns a list of all the labels currently accessible by accessibilityLabel

worm.press 'label' #touches a UI element by accessibilityLabel

worm.type 'label' 'words'  #types the inputted string into the accessible text field  accessibilityLabel 


3. Contribute
------------------------

If you're awesome enough to want to contribute

-fork it
-clone it
-push to a feature branch
-submit pull request
