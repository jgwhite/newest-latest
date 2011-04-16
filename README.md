Newest Latest
=============

Using simple keyword matching, newest-latest attempts to auto-discover and
aggregate projects from launch announcements in the feeds of your
favourite makers.

Created for [newest-latest.net](http://newest-latest.net/)

Usage
-----

Follow a maker

    NewestLatest::Maker.create! :name => "With Associates",
                                :feeds => %w[http://twitter.com/withassociates]

Lookup projects

    NewestLatest::Project.all

Dependencies
------------

[Mongo DB](http://www.mongodb.org/)

[Mongoid ODM Gem](http://mongoid.org/)

[Twitter Gem](http://github.com/jnunemaker/twitter)

Contributors
------------

[Jamie White](http://jgwhite.co.uk/)

License
-------

Copyright &copy; 2011 Jamie White
