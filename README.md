newest-latest
=============

Using simple keyword matching, newest-latest attempts to auto-discover and
aggregate project launch announcements from the feeds of your favourite makers.

Created for [newest-latest.net](http://newest-latest.net/)

Usage
-----

Follow a maker

    NewestLatest::Maker.follow :name => "With Associates",
                               :feeds => %w[http://twitter.com/withassociates]

Lookup projects

    NewestLatest::Project.all

Contributors
------------

[Jamie White](http://jgwhite.co.uk/)

License
-------

newest-latest is Copyright &copy; 2011 Jamie White
