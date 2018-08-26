# jakeworth.com

[![Circle CI](https://circleci.com/gh/jwworth/jakeworth.com.svg?style=svg)](https://circleci.com/gh/jwworth/jakeworth.com)

This is the source code for my developer's blog, available here:

http://jakeworth.com

Here's my intention, from the [first post](http://www.jakeworth.com/hello-world):

> I’ve been writing code for a few years now, and am proud to be launching my own
> developer’s blog.
>
> The developer’s blog is a time-honored tradition in the world of software, and
> I am indebted to the many great programmers whose blogs I read.  Our community
> is incredible at sharing information.  My goal with this blog is to provide
> something of similar value, while building a record of the solutions I've found
> for future reference.
>
> I am a web developer working in Ruby on Rails, but am interested in a broad
> range of topics, including responsive design, performance, testing, database
> management, continuous integration, source control, open source contribution
> and operating systems, automation, 'startup life', and much more.  I hope to
> use this platform to share the challenges and triumphs I’ve experienced in
> front of a computer screen.  Thank you for reading.
>
> *Feb 9, 2014*

And here's a post about why I built this application in Ruby on Rails:

http://jakeworth.com/new-blog

### Installation

```
$ ./bin/setup
```

To restore the production database to development, run:

```
$ ./bin/db_restore.sh
```

### Testing

Run the tests with:

```
$ rake
```

Or, run the tests in parallel with [flatware](https://github.com/briandunn/flatware):

```
$ flatware fan rake db:test:prepare
$ flatware rspec && flatware cucumber
```

### Deployment

To deploy to a particular environment, run:

```
$ rake deploy ENV=<environment>
```

### Contributing

1. [Fork](https://help.github.com/articles/fork-a-repo/) it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Bug reports and pull requests are welcome on GitHub at
https://github.com/jwworth/jakeworth.com. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

### License

This project is released under the [MIT License](http://www.opensource.org/licenses/MIT).
