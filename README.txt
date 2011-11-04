jm3 ~/bin> gem install expander-0.0.1.gem
Successfully installed expander-0.0.1
1 gem installed
jm3 ~/bin> irb -rubygems
ruby version: ruby 1.8.7 (2011-06-30 patchlevel 352) [i686-darwin10.8.0]
ruby-1.8.7-p352 :001 > require 'expander'
 => true 
ruby-1.8.7-p352 :003 >   s = "some stuff http://t.co/xCCP4e8R more stuff #hello"
 => "some stuff http://t.co/xCCP4e8R more stuff #hello" 
ruby-1.8.7-p352 :004 > s.expand_urls
 => "some stuff http://guides.rubygems.org/make-your-own-gem/ more stuff #hello"