namespace :db do
  task :add_legacy_posts => [:environment] do
    puts 'Destroying posts'
    Post.destroy_all
    puts 'Creating legacy posts'
    create_legacy_posts
  end
end

def create_legacy_posts
  Post.create!(title: 'Hello World!',
url_slug: 'hello-world',
created_at: 'Sun, 09 Feb 2014 23:15:01 +0000',
body: "I’ve been writing code for a few years now, and am proud to be launching my own developer’s blog.

The developer’s blog is a time-honored tradition in the world of software, and I am indebted to the many great programmers whose blogs I read.  Our community is incredible at sharing information.  My goal with this blog is to provide something of similar value, while building a record of the solutions I've found for future reference.

I am a web developer working in Ruby on Rails, but am interested in a broad range of topics, including responsive design, performance, testing, database management, continuous integration, source control, open source contribution and operating systems, automation, 'startup life', and much more.  I hope to use this platform to share the challenges and triumphs I’ve experienced in front of a computer screen.  Thank you for reading.")
Post.create!(title: 'My First Pull Request: HAML',
url_slug: 'my-first-pull-request-haml',
created_at: 'Wed, 19 Feb 2014 16:00:12 +0000',
body: "My first <a href='https://github.com/haml/haml/pull/746'>pull request to HAML</a> was merged yesterday.

I love the open source community.  The tools I use every day are maintained by teams of volunteers around the world, working for the betterment of their creations. One of my goals for 2014 is contribute my own code to some of these amazing projects.

One such project is <a href='https://github.com/haml/haml'>HAML</a>. HAML is a markup language that functions like ERB but is visually simpler. If you're used to ERB there's a learning curve to HAML, but a real upside if you can power through it. I like the project and appreciate that it exists.

If you've never contributed to open source, the process can seem intimidating. Yes, you are publicly submitting your work to a global cabal of senior programmers. But like anything, it just takes time and research.

The only question that matters is: how can I improve this project? Ideas can come from anywhere, including an open issues list, bugs you've observed, or a feature you'd like to see.

I found a bug– a typo in HAML's README. Some might argue a documentation typo is unimportant, but I disagree. It's a user-facing bug, because the users of these tools are other developers, who will actually read the documentation. And it's also just the right size bug for a newer programmer who has no history with the project.

In order to submit to HAML, I first needed to make a fork of the project on Github. This is done through the UI. Here's my <a href='http://github.com/jwworth/haml'>fork</a>, a mirror of the project at the moment I pressed the 'Fork' button. You can update the fork by <a href='http://help.github.com/articles/syncing-a-fork'>syncing it</a>, but I don't plan to be working that long on the fix.

Next I cloned the fork to my machine, using:
<pre>$ git clone https://github.com/jwworth/haml</pre>
This initiated a git repository with all the files. I changed into the new directory, but before entering a single command, HAML complained, because I didn't have the right version of Ruby it needed.

I installed Ruby 2.1.0 using RVM:
<pre>$ rvm install 2.1.0
$ rvm use 2.1.0</pre>
Next I installed the bundle of gems needed to support HAML.
<pre>$ bundle install</pre>
This complained several times about various dependencies I was missing, which is typical. Such error messages are not reproduced here because they are unique to my environment. The only solution is to read the error messages and install whatever is missing.

Once <code>bundle install</code> finished, it was time to run the test suite.
<pre>$ rake</pre>
Output:

```
# Running tests:

..........

Finished tests in 0.666598s, 655.5675 tests/s, 2703.2785 assertions/s.
437 tests, 1802 assertions, 0 failures, 0 errors, 0 skips
```

Great– tests are passing. I now should be able to tell if my changes break anything. A failing test is a guaranteed rejection for your pull request, and many projects like Rails won't merge a new feature without an accompanying test. So, even for small fixes like this, being able to run the test suite is essential.

Next I created a task branch for my changes.
<pre>$ git checkout -b task/fix_typos</pre>
I found and fixed a handful of other typos while reading the documentation, which made my submission feel more significant. With the changes complete, it's time to commit them.
<pre>$ git add .
$ git commit</pre>
This launched Vim, where I wrote this commit message: <strong>Fix some typos [ci skip]</strong>. Every project's commit messages style is a little different, and it's good to try and match the tone of your project. The <strong>[ci skip]</strong> tells HAML's automated test suite not to test my changes, which some projects permit for certain kinds of commits.  I wouldn't include this unless I'd already seen the tests pass myself and was confident the project managers would allow it.

Next I pushed my changes to origin.
<pre>$ git push origin</pre>
I found my repo on Github and opened a pull request to HAML. Github makes this easy.

Ten minutes later my pull request was merged. It's gratifying to have your code accepted by the software elites and be part of a useful, relevant project. I recommend it. Even a minor improvement is an improvement, and part of what makes open source great.")
Post.create!(title: 'My First Pull Request: Sinatra',
url_slug: 'my-first-pull-request-sinatra',
created_at: 'Fri, 28 Feb 2014 16:09:19 +0000',
body: "When I was learning Ruby, <a href='http://www.sinatrarb.com/'>Sinatra</a> was the first framework I used.  It's popular in Ruby tutorials because it's easy to use and understand.  I'm a fan.  Sometimes if you're spinning up a sample app for a Meetup, Rails is not the right choice.  Enter Sinatra.  I'm sure it's great for a lot of other things, but that's how I've used it.

I've been trying to contribute to open source projects this year, and decided to work on Sinatra.  After reading the documentation, I found a few misspellings.  I think that typos and otherwise wrong information in a project's documentation are worth fixing, because good documentation makes a project easier to use and implies that the code is mature and well-maintained.

After reading the contribution guidelines, I forked and cloned the documentation repo.

<pre>
$ git clone https://github.com/jwworth/sinatra.github.com.git
$ cd sinatra.github.com
</pre>

Next, I made my changes and pushed them to Github.

<pre>
$ git add .
$ git commit -m 'Fix some typos'
$ git push origin
</pre>

On Github, I submitted my first <a href='http://github.com/sinatra/sinatra.github.com/pull/129'>pull request to Sinatra</a>.  A few hours later, the commit was merged into the project.  Victory!

Not quite.  Before long, a helpful Github user posted this comment on my contribution:
<em>
'The files in _includes are generated from other sources. This change (and the change to the sinatra-streaming docs) will be overwritten when the docs are regenerated. It should be made in the sinatra-contrib repo...'
</em>

As it turns out, the documents I edited are auto-generated by another project, <a href='https://github.com/rkh/sinatra-contrib'>sinatra-contrib</a>.  Which means that the next time they are auto-generated, my contribution would be overwritten.  Fail.

In order to make my changes last, I would need to submit them again to another project.  Once I found that repo, I forked and cloned it.

<pre>
$ git clone https://github.com/sinatra/sinatra-contrib.git
$ cd sinatra-contrib
</pre>

I made the changes (again) and pushed them up into a new <a href='https://github.com/sinatra/sinatra-contrib/pull/123'>pull request</a>.   This change was also merged in minutes; clearly it's a quite active project.

I hope to soon get into more complex bug fixes, but I'm finding that many of the projects I love are so sophisticated, you have to hang around for a while before you know enough to add value. It's a small barrier to entry, easily overcome.  I am enjoying adding smaller contributions in the meantime.
")
Post.create!(title: 'My First Pull Request: Capistrano',
url_slug: 'my-first-pull-request-capistrano',
created_at: 'Thu, 20 Mar 2014 17:48:37 +0000',
body: "The makers of <a href='http://capistranorb.com/'>Capistrano</a> describe it as a 'remote server and automation tool written in Ruby'.  Capistrano allows you to script repetitive tasks, such as the many steps needed to deploy.  Here is a command I run frequently:
<pre>
$ bundle exec cap internal deploy
</pre>
With this, Capistrano executes a series of steps that ends with our code deployed to an internal testing environment.  It's a useful tool and saves me a ton of work.

I decided I wanted to contribute to the project, and started reading through the CHANGELOG.  Today's open source projects are sophisticated efforts and the top contributors are involved in every change.  Capistrano further has a 'say no first' policy; you have to work get your pull request merged.

I started by reading the README, CHANGELOG, contribution guidelines, recent commits, and finally, the code.  Reading the code can be daunting but you need to give it a good try.  It's unlikely you will understand it all, but that's not the point.

Reading the CHANGELOG I found a misspelling that needed be fixed.  I found a few more misspellings in the file that handles software configuration management, so now I had the makings of a good pull request.

The first step I took was to fork the <a href='https://github.com/capistrano/capistrano'>Capistrano repository</a> on Github.  This created my own mirror of the code to work with.

Next, I cloned the fork to my computer.
<pre>
$ git clone https://github.com/jwworth/capistrano.git
</pre>
To start work, I changed into the new capistrano directory, switched my Ruby to a newer version (2.1.0) using RVM, and installed the bundle.
<pre>
$ cd capistrano
$ rvm use 2.1.0
$ bundle install
</pre>
Once all of the gems were installed, it was time to run the test suite:
<pre>
$ bundle exec rake
</pre>
The tests ran 200 examples with zero failures, which is good.  If the tests pass before and after making my changes, I have a reasonable assurance that I have not broken anything.  That assumes that the tests are good, something you can infer from the code, coverage, and climate (3.96/4 on codeclimate.com as of this posting).  It's a necessary practice.

I made my changes to the project and was ready to commit.  I did not include tests with the changes, because my changes only affected comments.  I did, however, run the test suite again after making my changes; same result.  Looking good.

I like to commit my changes to a dedicated feature branch.  To do that, I use 'git stash'.  From the master branch:
<pre>
$ git stash
$ git checkout -b task/fix_typos
$ git stash apply
$ git add .
$ git commit
</pre>
I wrote a simple commit message: 'Fix some typos'.  Next I dropped the stash and pushed to origin.
<pre>
$ git stash drop
$ git push origin
</pre>
In Github, I opened a <a href='https://github.com/capistrano/capistrano/pull/976'>pull request</a> to Capistrano.  It was merged a few hours later.

This is my tenth open source contribution in 2014.  Every project is different and going through the submission process has taught me something every time.")
Post.create!(title: 'My First Pull Request: SASS',
url_slug: 'my-first-pull-request-sass',
created_at: 'Mon, 24 Mar 2014 16:14:42 +0000',
body: "<a href='http://sass-lang.com/'>SASS</a> bills itself as 'the most mature, stable, and powerful professional grade CSS extension language in the world'.  It's called an 'extension language' of CSS because it augments the power of that language.

I'm grateful for SASS because it gives me more options as a developer.  I wanted to contribute to the project and decided to focus on documentation.

To start work, I forked the <a href='https://github.com/nex3/sass'>SASS repo</a>, cloned it to my machine, and installed the bundle.

Next, I ran the tests, which failed.  When this happens, it's tempting to assume that the build is broken, but that is rarely the case.  More than likely my environment is not set up properly.  I've found that it's better to assume the build is green, because it usually is.

The failure message was 'this method is depreciated'.  From past experiences, this seemed Ruby-related.  Sure enough, switching from Ruby 2.1.0 to Ruby 1.9.3 fixed it.
<pre>
$ rvm use ruby-1.9.3-p448
$ bundle exec rake
</pre>
1835 tests, 10923 assertions, 0 failures, 0 errors, 3 skips.  'Skips' are tests that aren't written or I can't run.  The three skips provided the error message 'can be run on Windows only', which makes sense, given that I'm developing with Ubuntu.

I started out by fixing some random typos, and in the process found whitespace, which are trailing blank spaces.  Whitespaces are ignored by the interpreter, but they should be avoided.  I decided to pause and hunt down whitespace.

Many teams won't accept commits that only remove whitespace, arguing that the gain of such an improvement is outweighed by the risk.  A 'whitespace commit' can invalidate older pull requests and introduce bugs.  There's also an argument that as long as humans write code, whitespace will exist, and that removing it is a somewhat of a fool's errand.  I'm going to do it anyway, because I am also fixing misspellings.

I wanted a script to find and fix the whitespace. After some reading, I found <a href='http://stackoverflow.com/questions/10711051/trailing-whitespace-elimination-script-for-multiple-files'>this post</a> and tweaked the command as such:
<pre>
$ find . -type f -name '*.rb' -exec sed --in-place 's/[[:space:]]\+$//' {} \+
</pre>

A breakdown:

* <strong>find .</strong> - Search for files all in a directory hierarchy
* <strong>type -f</strong> - Limit the search to regular files
* <strong>-name '*.rb'</strong> - Limit the search to files that end in '.rb' (this prevents me from altering binary files)
* <strong>-exec</strong> - Execute anything to the right of this command as a subprocess of the first (find') command
* <strong>sed</strong> - Use the stream editor, which finds and transforms text
* <strong>--in-place</strong> - Edit the files in place
* <strong>'s/[[:space:]]\+$//' {} \+</strong> - Use this regular expression for the search, which finds any extra space at the end of a line or space on a line all by itself, removes it, then terminates the command

Scripts are powerful; don't use them unless you know what they do.

This script found twelve instances of trailing whitespace, which I removed and committed to a new branch called 'task/fix_typos_and_whitespace'.  On top of that I added twelve typo fixes.

Running the test suite again returned the same result, a decent assurance that I didn't break anything.  I pushed my changes to Github and opened this <a href='https://github.com/nex3/sass/pull/1182'>pull request</a>.  It was merged the next day.  Thanks to the team at SASS for building a great project.
")
Post.create!(title: 'Why I Like Git',
url_slug: 'why-i-like-git',
created_at: 'Thu, 27 Mar 2014 06:09:59 +0000',
body: "I'm lucky to have always programmed in a world with good version control tools. It's one of the first things I learned and a foundation of my workflow.

Version control, also known as revision or source control, is a tool software developers use to track changes to their code.  A popular choice is called Git, and it is awesome.

Building software as a team poses unique challenges.  Storing the team's project in a central location, like a server, makes sense; we want one version of the project that everybody can update.  But with many people making changes, shouldn't we have a log showing what they're all doing?

Version control systems (VCS) were created to solve this problem.  VCS's take a directory and wrap it in something called repository, a 'repo'.  This repo takes a snapshot of the folder when anything is changed.  As a result, it's easy to go back and see when a file was added, modified, or deleted.  It provides instant, granular visibility.

So we've installed a VCS, and now know who's behind every change.  And as long as the VCS repo exists, it's nearly impossible to lose the project, because we have many copies from the past.  But what happens if the server explodes, and we lose the repo?

This is where Distributed Version Control Systems (DVCS) like Git came from.  With a DVCS, each client owns a mirror of the repository, including every file and change.  With a complete copy of the repo on every client computer, we have a robust failsafe.  It nullifies the conflict of two people are editing the same file at the same time, because they are actually editing unique local files.  When the changes are saved, or 'committed', each change gets assigned a long checksum called a SHA-1.  One of many benefits of this system is that because everybody works on their local copy, team members can work for long periods of time without an internet connection.

Git was designed to be fast, simple, supportive of non-linear development (many branches), fully distributed, and scalable.  It appears simple at first, but it's quite powerful.

I hope to write more about Git in the future, including customization, working with remotes, branching, and helpful tools such as <a href='http://github.com'>Github</a> and <a href='http://nvie.com/posts/a-successful-git-branching-model/'>Git Flow</a>.  Git takes time to learn, but it's time well spent, because programmers who master their VCS write better code and can even (occasionally) work miracles.")
Post.create!(title: 'Sinatra Pull Request #126',
url_slug: 'sinatra-pull-request-126',
created_at: 'Fri, 28 Mar 2014 22:20:15 +0000',
body: "Reading Sinatra's documentation today, I found a few things to improve.  I checked and didn't see anybody working on them, so I decided to fix them.

I've already contributed <a href='http://worth-chicago.co/my-first-pull-request-sinatra'>once</a> to this project, so I had a fork and local repo ready.  My fork was almost a month old, so I wanted to ensure it was current.

To do this, I needed to sync my fork with the project.  Step one was to verify that I didn't have an upstream already set.
<pre>
$ git remote -v
origin  ssh://git@github.com/jwworth/sinatra-contrib.git (fetch)
origin  ssh://git@github.com/jwworth/sinatra-contrib.git (push)
</pre>

This lists each remote that is set with the tag 'verbose' (give me more information').  My only remote was my fork, 'origin', so I set an upstream.
<pre>
$ git remote add upstream https://github.com/sinatra/sinatra-contrib
</pre>
Running the 'remote' command again, I saw my upstream:
<pre>
$ git remote -v
origin  ssh://git@github.com/jwworth/sinatra-contrib.git (fetch)
origin  ssh://git@github.com/jwworth/sinatra-contrib.git (push)
upstream  https://github.com/sinatra/sinatra-contrib (fetch)
upstream  https://github.com/sinatra/sinatra-contrib (push)
</pre>
Next, I fetched the changes:
<pre>
$ git fetch upstream
remote: Counting objects: 1, done.
remote: Total 1 (delta 0), reused 1 (delta 0)
Unpacking objects: 100% (1/1), done.
From https://github.com/sinatra/sinatra-contrib
 * [new branch]      1.3.x      -> upstream/1.3.x
 * [new branch]      1.4.1      -> upstream/1.4.1
 * [new branch]      issue_27   -> upstream/issue_27
 * [new branch]      issue_28   -> upstream/issue_28
 * [new branch]      issue_39   -> upstream/issue_39
 * [new branch]      master     -> upstream/master
 * [new branch]      template-renderer-safety -> upstream/template-renderer-safety
</pre>
You can do a lot of things at this step, but my goal was to get the 'upstream' changes and merge them into my 'downstream' master branch.
<pre>
$ git merge upstream/master
Updating dc38ff1..1094b86
Fast-forward
 lib/sinatra/config_file.rb |    2 +-
 lib/sinatra/streaming.rb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
</pre>
Next I installed the bundle (output omitted) and ran the tests.
<pre>
$ bundle install
$ bundle exec rake

..........

Finished in 5.91 seconds
825 examples, 0 failures
</pre>
The tests passed.  I made my changes to a file called 'reloader' and committed them to a task branch with the commit message 'Fix some typos'.  Running the tests again showed 825 examples and zero failures, a good sign.

After pushing to origin I opened this <a href='https://github.com/sinatra/sinatra-contrib/pull/126'>pull request</a>.  Sinatra's automated test suite ran and passed, as expected.  A little later, it was merged into the project.

When I was learning to program, I wanted to hone my skills by contributing to open source.  It seemed daunting at first.  Just to open a pull request to a Github Ruby repo, you have to understand Git, Ruby, Bundler, RSpec and/or Cucumber, and your OS.  Googling 'how can I contribute to open source?' yields a wealth of 'new programmer' curiosity.

Most open source projects welcome contributions, as long as they are improvements.  The keys for my contributions have been:

* Finding projects that I care about (read the Gemfile of the app that 'pays your bills' for inspiration)
* Understanding how their teams function (What are the contribution guidelines? What kind of pull requests get merged?)
* Following a simple checklist of best practices
* Reading error messages, responding to comments on your pull request, and not giving up at the first obstacle")

Post.create!(title: 'One Monitor',
url_slug: 'one-monitor',
created_at: 'Mon, 31 Mar 2014 23:49:44 +0000',
body: "I have one computer monitor on my desk.  Not long ago ago, this was the norm for everybody, but today, I am the only person in my office who doesn't have two or more monitors.  Three or four in a semicircle is common.

My monitor is made by Dell and it's at least twenty inches.  It works for me.  People sometimes ask why I don't want another, and this post is my attempt to explain.

I used to have multiple monitors.  One screen was my personal email, the other was my terminal and text editor.  When I wanted to look at a different screen, I turned my head.  It seemed efficient, because I was already switching windows all the time.

When I started a new job, I was given an older computer that didn't support multiple monitors, temporarily forcing me down to one.  I could have found software and hardware to circumvent this limitation, but I was busy getting up to speed as a new employee.

At first, I didn't like the change.  Wouldn't I be half as productive with half as many screens?  It felt archaic and lame.

In a short amount of time, my opinion started to change.  Both Windows and Linux come with the command <code>ALT + TAB</code>, which pulls up a list of every program running.  If you are going back and forth between two programs quickly (like a browser and a text editor), you don't even have to pull up the entire menu, because the default behavior is to switch back to the window you just left.  Committing <code>ALT + TAB</code> to muscle memory took about two hours.  I don't even think about it anymore.  If you use an command prompt text editor like Vim, it's even easier, because the command line and the editor are the same program.

Here is a short list of why I like this setup:

* <strong>It's easy to switch between office and remote</strong>.  I'm already using one screen, so when my office internet dies and I have to take the laptop home or to a coffee shop, there is no friction in the transition.  One screen == one screen.  This is handy at a small startup.
* <strong>Less distraction</strong>.  Multiple monitors present a feast of information.  One screen is like having 'distraction free' mode enabled on every program, all the time.  I think about time-wasting internet sites less when the aren't easy to see.
* <strong>More ergonomic</strong>.  Most people with two monitors split them in the middle of their workspace and position themselves right in the middle.  They are never looking head-on at either screen, unless they are constantly rotating their chair.  I found this awkward.
* <strong>More minimal</strong>.  I realized that I just didn't need another monitor.  Switching to one meant one less point of failure, one less screen my company had to pay for, one less screen to clean, one less screen to spill coffee on, etc.  I was inflating my information consumption to fit a second array of pixels.

<a href='http://www.nytimes.com/2014/03/20/technology/personaltech/surviving-and-thriving-in-a-one-monitor-world.html'>There's evidence</a> that multiple monitors does not increase productivity.  That has been my experience.  But productivity is personal, and what works for one may not work for all.  If you're thinking about it, buck the trend and give it a try.  You can always get your other monitor back if you don't like it.")
Post.create!(title: "Save a Command's Output to a File (Unix)",
url_slug: 'save-a-commands-output-to-a-file-unix',
created_at: 'Wed, 09 Apr 2014 04:44:42 +0000',
body: "One tool that I love allows you to take the output of a terminal command and save it in a file.  That command is:

<pre>
$ command > filename
</pre>

An example:

<pre>
$ ps aux > data.txt
</pre>

This runs the command <code>ps aux</code> and sends the output to a file 'data.txt'.  If that file exists, it will be overwritten; if it doesn't exist, it will be created.  You can check the output using <code>cat</code>:

<pre>
$ cat data.txt
process status (ps) for all users (a), with owner (u), and processes not attached to the terminal (x)
</pre>

Another helpful modification is to replace <code>></code> with <code>>></code>, like this:

<pre>
$ ifconfig >> data.txt
</pre>

This command takes the output of the <code>ifconfig</code> command and <em>appends</em> it to the end of 'data.txt'.  Like the first command, if that file doesn't exist, it will be created.  Inspecting that file once again with <code>cat</code>:

<pre>
$ cat data.txt
process status (ps) for all users (a), with owner (u), and processes not attached to the terminal (x) + interface configuration (ifconfig)
</pre>

As you can imagine, the uses of this command are limitless.  A test failing on your computer but not failing for a remote contractor?  Run the spec, save the output into a text file, and email it to them.  Debugging a failing deployment to a hosting provider like Heroku?  Run the deploy command, save the output to a text file, and post it in a community forum.  Is a test failing only at a certain time of day?  Run the <code>>></code> variant, with your computer clock set to various times, and send all the data to one summary file.

Anytime you are working with a remote person it is much better to provide real, complete data rather than a fragment.  In other words, be specific rather than general.

The terminal is one of the most vital tools a developer has.  I use it constantly, and my first instinct when approaching any new computer task is to see if it can be done in the terminal.  Usually it can, much faster than any alternative.

Besides routine use, one resource I recommend to hone your terminal skills is Zed Shaw's <a href='http://cli.learncodethehardway.org/book/'>Command Line Crash Course</a>.  It covers all the basic commands in the trademark Zed Shaw style.
</channel>
")
Post.create!(title: 'Free Programming Books',
url_slug: 'free-programming-books',
created_at: 'Tue, 15 Apr 2014 22:27:42 +0000',
body: "It's a great time to learn programming.  There has recently been an explosion of free online resources for every platform, including ebooks, web apps, videos, and games.  The rise of sites like Stack Overflow and Github make it easy to share and explain code to the masses.

<a href='https://github.com/vhf/free-programming-books'>Free Programming Books</a> is an open source repository on Github that has begun the monumental task of collecting all of these free resources in one place.  It's an idea ripe for the Github platform, and already 376 people have contributed over 2,000 commits, cataloging resources across the technology spectrum.

It's a big list, one that takes effort to maintain.  To keep it relevant, people will need to add content, alphabetize, check syntax, and fix broken links, especially for the less popular technologies.  Like an encyclopedia, the project will never be finished.

I just submitted my third <a href='https://github.com/vhf/free-programming-books/pull/883'>pull request</a> to the project and plan to keep contributing.

New people looking to get into open source should look for projects like this.  The barrier to entry is low and they highlight what is great about the community.  This is an international team of programmers working for free, subsidized by enterprise (Github), building something that adds value to what we do.  Very nice.")
Post.create!(title: 'Rails Conf 2014 Wrap-Up',
url_slug: 'rails-conf-2014-wrap-up',
created_at: 'Wed, 30 Apr 2014 15:44:04 +0000',
body: "I just returned from <a href='http://www.railsconf.com/'>Rails Conf</a> 2014 here in Chicago.

This was my first conference as a developer, and my first time being immersed in the Rails community.  I'd like to take a moment and reflect on my experience.

I began Rails Conf thinking it would be a fun, educational break from my daily work, and I left convinced that conferences should be a part of every developer's journey.  I was exposed to deep ideas, witnessed programming history, and met great people.  It was incredible.

The first and probably biggest benefit of Rails Conf for me was <strong>being exposed to deep ideas</strong> from the smartest minds in our field.  The first time I was really impressed happened on Day One, during 'Advanced Arel: When ActiveRecord Just Isn't Enough' with Cameron Dutro.  I've never touched Arel, and a few people I was sitting with had barely worked with it either.  If you are skilled enough to follow every minute of this talk, you are good at Rails.  It prompted a deep discussion about querying among my group, the type of intellectual wandering that is hard to start on your own.

I had similar moments during 'How to Build a Smart Profiler for Rails' with Tom Dale and Yehuda Katz, 'Ruby on Rails Hacking Guide' with Akira Matsuda, 'All the Little Things' with Sandi Metz, 'An Ode to 17 Databases in 33 Minutes' with Toby Hede, 'Curmudgeon: An Opinionated Look at an Opinionated Framework' with Ernie Miller, and 'Cognitive Shortcuts: Models, Visualizations, Metaphors, and Other Lies' with Sam Livingston-Gray.  I struggle to imagine a person who could sit through all of these talks and not learn something.  Software is so broad that to be an expert in even one thing is difficult, and I love getting a window into such an expert's mind.

All of these presentations will be available online via <a href='http://www.confreaks.com/'>Confreaks</a> at some point in the future.  But the chance to meet and engage with the speaker is only available at the conference.

The second benefit of Rails Conf was <strong>witnessing programming history</strong>.  DHH's opening keynote and Aaron Patterson's (Tenderlove's) closing keynote are two examples.

In the opening keynote, DHH (the creator of Rails) framed TDD as a fad diet.  It was a noteworthy moment.  Likewise, his claim that we are 'Software Writer' versus 'Software Engineers' got me thinking.  DDH's keynote lit a fire under the conference, spurring debate and forcing every presenter to respond.

Tenderlove's keynote centered on a pitch for AdequateRecord, his branch off of Rails' ActiveRecord that caches SQL queries.  What made it memorable was that he merged that branch into Rails master live on stage.  It was an historic moment in the changelog of Rails and I was glad to be there.

The third benefit of Rails Conf was <strong>meeting great people</strong>.  Many developers work alone, and the chances to socialize are rare.  Everybody I met, from the Ruby Heroes to brand new programmers, was friendly and encouraging.  Even in the vendor area, the dialogue was always easy and informative, never heavy-handed.  It was great to be around others who understand the unique challenges and triumphs of writing code.

Rails Conf 2014 was well worth the ticket price, and I recommend attending future conferences to any developer.  Thanks to my company for sending me, everybody at Ruby Central, and all of the speakers.")
Post.create!(title: 'Mass-Opening Like Files in a Directory',
url_slug: 'opening-all-documentation-files-in-a-directory',
created_at: 'Thu, 08 May 2014 18:43:45 +0000',
body: "The Unix command line is powerful.  Before doing anything in a GUI, I usually first try to see if it can be done in the command line.  Often it can.

Last week I was reading Rails source code, and wondered: <em>would it be possible to easily load all of the documentation for this project in a text editor?</em>  When you load a large directory in a text editor, individual files are buried in a structure of subfolders.  I wanted to open them all at once, so I started experimenting with commands.

The first step was to define what kind of files have the content I need.  Rails uses '.rdoc' and '.md' files for documentation, so that's what I wanted to look at.

I used the <code>find</code> command for my search (only 10 results are shown):
<pre>
$ find -name \*.md -o -name \*.rdoc
./railties/CHANGELOG.md
./railties/RDOC_MAIN.rdoc
./railties/README.rdoc
./railties/lib/rails/generators/rails/app/templates/README.rdoc
./railties/lib/rails/generators/rails/plugin/templates/README.rdoc
./RELEASING_RAILS.rdoc
./README.md
./actionmailer/CHANGELOG.md
./actionmailer/README.rdoc
./CONTRIBUTING.md
...
</pre>
My goals was to open every file in this list with a text editor.

This is the command I tried:
<pre>
$ find -name \*.md -o -name \*.rdoc | subl
</pre>
This command executes the arguments on the left side of the pipe (find every file in this directory whose name ends in .md or .rdoc') and passes the output to the command on the right (open that list in Sublime Text 2').  It wasn't working.  After checking my syntax and trying the command a few different ways, I concluded that Sublime Text 2 did not understand the information being passed to it.

After some research, I learned that programs do not accept STDIN arguments by default. A program must be deliberately designed to accept STDIN arguments, which takes development time and energy.  Looks like the Sublime Text team chose the simplest solution: let the command line worry about parsing user input.

Just as I was about to abandon the idea, I found a helpful <a href='http://unix.stackexchange.com/questions/93334/why-cant-certain-programs-like-readlink-take-input-from-a-pipe'>Stack Exchange thread</a>, which pointed me to the <code>xargs</code> command.  <code>xargs</code> takes a program that only accepts command-line arguments, and makes it accept STDIN.

Here is the command I ran, which opened in my text editor every '.md' and '.rdoc' file (71 in Rails):
<pre>
$ find -name \*.rdoc -o -name \*.md | xargs subl
</pre>

Hacks like this take me a while to figure out, but I think they are worthwhile if there's even a small chance they will make me faster in the future.")
Post.create!(title: 'My Keyboard: Microsoft Natural Ergonomic Keyboard 4000',
url_slug: 'my-keyboard-microsoft-natural-ergonomic-keyboard-4000',
created_at: 'Tue, 13 May 2014 21:38:14 +0000',
body: "This week I've been trying to improve my workspace.  Programming requires a lot of repetitive actions in a sedentary position, and I'm starting to feel the effects.  Any effort invested in trying to make the work easier on your body is time well spent.

About six months ago I bought a Microsoft Natural Ergonomic Keyboard 4000, and I'd like to write a short review.  <strong>Bottom line: it's pretty great</strong>.

I'd seen this keyboard a few times before buying one myself.  It looks like a warped version of a standard Microsoft keyboard; the letter keys are different shapes and rise together in a low arc, with the right-hand and left-hand keys separated by a triangle of plastic dead space.  There is a large wrist guard, an array of buttons at the top, and the whole thing can sit flat on a desk or almost two inches higher on a removable stand.

It's different-looking and seems to imply a steep learning curve, but that was not my experience.  I moved past the weirdness in about fifteen minutes, and in the process learned that I've been hitting the '7' key with my left index finger instead of my right.  On a normal keyboard this was trivial, but on this keyboard it's a giant inefficiency.  Fifteen minutes in and I'd already learned something.

On to the buttons and keys.  In typical Microsoft fashion, there are a lot of them, which is either convenient or overkill, depending on your preferences.  I am in the second camp, but they don't do any harm.

The top of the keyboard has a row of buttons with icons, for 'Home', 'Search', and more.  These keys are not useful to me professionally but might be to a home user.

All the other keys are standard, besides the fact that they are slightly shaped to better fit a human hand.  They have a decent action and are much quieter than the standard keyboards around my office.  That's a plus, because I find loud typing distracting.

The keyboard comes in wired and wireless variants.  I chose wired because I don't like changing batteries.

The biggest thing I miss with this keyboard is the classic red Lenovo TrackPoint center button from my laptop.  That button, combined with the 'mouse keys' under the space bar, gives you a lot of power without ever touching a mouse.  The Microsoft Natural tries to address this with a slider toggle, found in the dead space between the left and right hands.  It took some reading to figure out what it was supposed to do, and get it working on Ubuntu 12.04.  This <a href='http://askubuntu.com/questions/33038/how-to-get-microsoft-natural-ergonomic-keyboard-4000s-zoom-slider-and-other-bu'>forum post</a> was helpful, and once I fixed up my '/etc/udev/rules.d/98-ms-ergo.rules', I had a working scroll.  It's not the same, but it gets the job done.

The big question is, does this keyboard make my life better?  I think so.  When typing, the hands rest naturally, more like they are on a piano keyboard in standard position than on a computer.  The wrist rest provides good support.  The wider distance between my hands means less strain on my upper body.

You can hack for hours in a coffee shop on a laptop keyboard, but for sustained coding over years, I think something like this is worth trying out.")
Post.create!(title: 'Linux is Awesome',
url_slug: 'linux-is-awesome',
created_at: 'Fri, 23 May 2014 22:05:29 +0000',
body: "I've been using Linux (Ubuntu 10.04 LTS and 12.04 LTS) for almost a year.  It's awesome.  I grew up on Windows and thought I'd never switch.  Well, I did, and I won't be going back.

For a user, Linux is great because it gives you so much power.  If I want to get software upgrades, I run:
<pre>
$ sudo apt-get update
$ sudo apt-get upgrade
</pre>
Once I'm back from refilling my water bottle, my system is patched.  Zero GUI interaction.  Awesome.

As a developer, Linux is an excellent choice.  If you write code, there are a lot of good reasons to give Linux a try.

Like many people my age, I grew up with Windows.  It's hard to remember just how totally Microsoft owned the '80's and '90's.  I didn't see a lot of Macs.  And with great operating systems like Ubuntu still years in the future, I learned Windows.

This carried into my programming.  Windows was a choice of convenience.  So many other things about programming were foreign that switching to an entirely different environment seemed like a giant, unnecessary leap.  My learning began in online tutorials like <a href='http://www.codecademy.com/'>Codecademy</a>, where my choice of OS seemed largely irrelevant.

There comes a time in learning to program where you have to wean yourself off tutorials and do the actual work of writing code.  Often called 'yak shaving', this includes installing your language, compiler, and tools, learning to use a text editor and source control, and debugging.  It's mundane work and there is no 'manual', which is why it's so hard for beginners.

When it came time for me to make that transition with Ruby, I had a reality check about Windows.

To install the tools you need to be a Ruby developer on a Windows machine, follow these steps:

* Figure out which tool you need
* Search for it online
* Realize that the tool does not run on Windows
* Find an open source project made by some awesome people that allows an altered, outdated version of the tool you need to run on Windows
* Install it (may take hours if you're new)
* Code!

I've felt the reverse pain of this trying to install Internet Explorer on Ubuntu with Wine.  Great projects fighting an uphill battle.

Here is the same process on a Unix-based system:

* Read about the tool you need
* Search for it online
* Install it with <code>apt-get</code>
* Code!

Why is this so?

I think it's because it's easier to use a tool in the environment where it was created.  Developing Ruby, which was written on Unix-based systems, is just going to be a more straightforward process on a Unix-based system.

Unix-based systems rule the open source development world, and as a result, that is the environment the best tools were written on.  If you want to use them on Windows, somebody has to make a translation.  That takes time and effort, and there is an unavoidable delay between the when the tool is updated and when the Windows-compliant version is released.  You will never be on the cutting edge.

So in a way, I felt compelled to switch to a Unix-based system.  I went with Ubuntu because it is free (although you can <a href='http://www.ubuntu.com/download/desktop/contribute'>donate</a> to the project).  It turns out it's a pretty great OS.

If you work with Linux servers, then the decision to use that environment yourself becomes more compelling.  I like being able to SSH into a server, apply patches, edit files with Vim, reboot, and go back to writing code without having to think too hard.

Macs are beautiful pieces of art, and I might switch someday.  But besides the excellent hardware, I don't see a reason.  I've heard that a lot of developers use Macs because they are a solid choice for both professional and home use.  That is a reasonable argument.

Linux has been a great change for me.  There are many other reasons to switch, which I won't repeat here.  When somebody with a background like mine wants to learn programming, with Ruby as their first language, I always advise them to get a Unix-based system, unless they are hungry for a challenge.  With abundant free operating systems and virtual machines to choose from, there is no reason to not experiment.  The first time you switch Rubies with <a href='https://rvm.io/'>RVM</a> (one of many examples), I think you'll be hooked.")
Post.create!(title: 'Principles of the Agile Manifesto: #1',
url_slug: 'twelve-principles-of-agile-software-1',
created_at: 'Tue, 17 Jun 2014 22:32:42 +0000',
body: "I've been learning about Agile software development this year.

Agile is a software development methodology that was defined in 2001 with the document <a href='http://agilemanifesto.org/'>The Agile Manifesto</a>.  Among other contributions, Agile offers a set of twelve principles to guide software development teams in the twenty-first century.

Not every team is Agile or has a full-time Agile Coach, but the principles defined in The Agile Manifesto have had a big impact on the entire technology industry.  They are worth considering even if your team doesn't adopt them all.

I'd like to look at each principle and reflect on how I've tried to apply it to my work.

The first principle of Agile is:
<em>
'Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.'
</em>
Breaking this sentence down:
<em>
'Our highest priority is to satisfy the customer...'
</em>
Meeting this requirement means understanding who my customer is.  For a social networking startup, the easy answer would be our users.  But I don't think it's that simple.

I work for many stakeholders.  My boss is a customer, because he depends on my code to be functional and delivered on schedule.  My coworkers are customers, because their success depends on a reliable product.  Our supporters are customers, because they have put their assets and reputations forward in support of what we do.

All of these are customers, and they all need to be satisfied as my highest priority.

Reading on:
<em>
'...through early and continuous delivery...'
</em>
This is one of the hardest parts of Agile for me, and I'm still figuring it out.  Continuous delivery is the idea that a lot of small, incremental deployments are better than one giant deployment, because it's easier to fix mistakes and also pivot when the changes between each release are small.

I recently relearned the value of early and continuous delivery when I waited until late in a deployment cycle to make the first push to our internal testing environment.  The product wasn't production-ready, and I didn't want to send it to testing, where it would trigger a stream of bug reports.  So I waited, continuing to fix bugs.

The cost of this choice was that when I finally did deploy for testing, we dropped a huge list of changes onto the server, some of which needed to be exhaustively tested.  My quest for perfection (which does not exist) was only adding risk into the release.  A better solution would have been to deploy for testing earlier, let the team find the bugs I knew about, and deal with them when they came.  I could have kept working, and given them the chance to find other bugs I wasn't already tracking.

Reading on:
<em>
'...of valuable software.'
</em>
What is valuable software?  That's not an easy question, because value is relative.  To me, software is valuable when it advances the objectives of the business.  Anything built for internal use, such as a custom chat service for employees, must be justifiable in the context of the company's larger business objectives.  For companies where the team is remote (like Github), a custom chat service might be a crucial tool.  If a program is functional and advances the business, then I think it is valuable software.

<a href='http://agilemanifesto.org/'>The Agile Manifesto</a>")

Post.create!(title: 'Principles of the Agile Manifesto: #2',
url_slug: 'principles-of-the-agile-manifesto-2',
created_at: 'Tue, 24 Jun 2014 19:18:47 +0000',
body: "The second principle of the Agile Manifesto is:
<em>
'Welcome changing requirements, even late in development. Agile processes harness change for the customer's competitive advantage.'
</em>

Taking a look at this principle, we start off with:
<em>
'Welcome changing requirements, even late in development.'
</em>

If we can agree that satisfying the customer is the <a href='http://worth-chicago.co/twelve-principles-of-agile-software-1/'>top priority</a> for an Agile team, and that customers can change their minds, then this idea follows Principle #1.  You have to satisfy the customer, even when they aren't sure what they want.  I think a few important steps here are stating the requirements, checking in regularly, anticipating changing requirements, and deploying early.

One of the most important steps is stating the requirements from the start.  We use <a href='http://trello.com'>Trello</a>, a free online project management tool that is easy to use.  Trello lets us make 'cards' on a virtual whiteboard.  The cards are a record of our conversation, the requirements we've agree on, and any external links.  It's a great tool.

After we've begun work, a second important step is to check in regularly with all stakeholders.  Daily stand-ups are one of many opportunities to achieve this.

A third thing I try to do is anticipate changing requirements.  If an application includes an administrative dashboard for non-technical staff, I try to imagine whether the feature I'm building needs to be exposed there.  It might not make sense to expose it preemptively, but just thinking that through starts an important conversation with the customer.

I also think it's important to deploy early for testing to a company-wide environment.  Seeing the code in action can answer many questions, and help the team catch obvious bugs or holes in the plan.  If you can <a href='http://en.wikipedia.org/wiki/Eating_your_own_dog_food'>eat your own dog food</a>, all the better.  The <a href='http://www.joelonsoftware.com/articles/fog0000000356.html'>Iceberg Secret</a> is a crucial tool for managing expectations during this process.

Continuing on:

<em>'Agile processes harness change for the customer's competitive advantage.'
</em>

How can a software development team harness change?  I think the main requirement is that the team needs to be composed of pragmatic observers of the technology landscape.  Staying open-minded and uncoupled from any framework or ideology allows the team to choose the best tool for the job, even if that tool is new and unfamiliar.

An example would be site responsiveness.  Making a site responsive to any screen size is mandatory today, but it was not a major consideration even a few years ago.  A team that recognized this early on (say, with the launch of the iPhone or iPad), learned how to make responsive sites, and started building that functionality into their customers' websites, passed to those customers a competitive advantage.  There is a lot to gain by adopting a technology early, and Agile teams take advantage of this by anticipating change.

<a href='http://agilemanifesto.org/'>The Agile Manifesto</a>")

Post.create!(title: 'Technical Interview Questions',
url_slug: 'technical-interview-questions',
created_at: 'Tue, 15 Jul 2014 22:21:02 +0000',
body: "I recently had the chance to give a technical interview.  I'd like to document how I set up the interview.  These steps are mostly directed at hiring a junior or mid-level developer.

Technical interviews are an important stage in the hiring process.  For the candidate, it's your chance to show your skills and converse with your future coworkers.  For the company, it's your best shot to determine a fit.

I actually enjoyed going through this process myself as a candidate.  Having come from a non-technical background, it's refreshing to be evaluated objectively (as much as any interview can be objective) on my skills and knowledge.  I either have the skills and answers they want, or I don't.  I find it low-pressure compared to an interview for, say, a management position.

After reading Jeff Atwood's great post <a href='http://blog.codinghorror.com/how-to-hire-a-programmer/'>How to Hire a Programmer</a>, I decided to structure my technical interview to be:

* Concrete:  No softball questions
* Open:  There isn't one right answer; what matters is how the candidate thinks
* Comprehensive:  Encompasses most or all of the job responsibilities

After 'breaking the ice' to make us both comfortable, we got started.

<strong>Whiteboard Test</strong>

I love the whiteboard.  It reveals much about a person, from how they work under pressure to their ability to explain an abstract idea.

We did a few whiteboard programming tests together.  There is ample raw material for such evaluations on the internet, from a simple 'Hello World' to a math problem from <a href='http://projecteuler.net'/>Project Euler</a>.

I asked the candidate to use the language she felt most comfortable with, with a preference for Ruby.  She chose Ruby and worked through the problem on the board.  When finished, we walked together through each iteration of the method with her in the lead, explaining, and me asking questions.

<strong>Technical Questions</strong>

I had three or four questions prepared in a couple of different subject areas.  I like to ask a broad question, take notes, and then ask any follow-up questions that come to mind.  It's much more fun to have a discussion.

The first subject area was Rails.  A sample question: <em>What are the strengths and weaknesses of the Rails platform, and of the Ruby language?</em>  If you are a newer programmer and mention 'convention over configuration', as this candidate did, you get points from me.

The second subject area was Object Oriented Programming (OOP).  A sample question: <em>What is the difference between a class and module?</em>  In the future I'd like to work this into a series of questions where the candidate explains the different components of Ruby (classes, modules, methods, instantiated objects, etc.) as physical objects.

The third subject area was Testing.  A sample question: <em>Do you use TDD?  Why or why not?</em>  This can reveal a lot about how the candidate works.

The fourth area was General Programming.  Anything relevant is fair game here.  I want to know what the candidate thinks about working at a small startup.  Will they thrive in the uncertainty?  Have they developed self-reliance and a strong professional voice?  What do they think about the current debates going on within our field?

<strong>Q & A</strong>

At the end, I open up for questions.  Having any questions at all is an essential indicator of mutual interest for me.  Provided those questions show interest and a basic understanding of what we do, and I can answer them, then this phase is successful.

Hiring is all about information.  You can't eliminate risk, and the more information you have, the less risk you take.  With that in mind I plan to A/B test my interviewing style over the next few months.  What questions yield the best information?  Those are the questions I want to ask.
")

Post.create!(title: 'Heroku PGBackups Testing',
url_slug: 'heroku-pgbackups-testing',
created_at: 'Wed, 06 Aug 2014 21:21:59 +0000',
body: "We recently moved some of our environments, including their PostgreSQL databases, to Heroku.  Heroku differs from a basic Linux server in many ways, and we wanted to ensure that we could restore the database in an emergency.

The key questions to answer were:

* Do we have automated backups?
* Does everyone on my team know how to quickly restore a backup?
* Do the backups work?

My approach was to create a test database for the app, the same size and configuration as the production database, then restore a backup of the production database onto it using the Heroku addon 'pgbackups'.  This is the checklist of steps I came up with.

First, provision a new test database for the app.
<pre>
$ heroku addons:add heroku-postgresql:standard-yanari --app my-custom-app
Adding heroku-postgresql:standard-yanari on my-custom-app... done, v77 ($50/mo)
Attached as HEROKU_POSTGRESQL_GREEN_URL
The database should be available in 3-5 minutes.
 ! The database will be empty. If upgrading, you can transfer
 ! data from another database with pgbackups:restore.
Use `heroku pg:wait` to track status.
Use `heroku addons:docs heroku-postgresql` to view documentation
</pre>
Note, the new database is known as 'HEROKU_POSTGRESQL_GREEN_URL'; for reference, the production database is known as 'HEROKU_POSTGRESQL_CYAN_URL'.

Next, turn on maintenance mode to prevent users from modifying the database.
<pre>
$ heroku maintenance:on --app my-custom-app
</pre>
You can verify this by going to the website and looking for a maintenance page.

Next, fire up a Rails console.  We are going to both count the users and create a new user as a checksum against the test database.  If it's a legitimate copy, the data should transfer.
<pre>
$ heroku run rails c --app my-custom-app
Running `rails c` attached to terminal... up, run.5324
Loading production environment (Rails 3.2.18)
irb(main):001:0> User.count
   (2.2ms)  SELECT COUNT(*) FROM 'users;
=> 2411
irb(main):002:0> User.create!(password: 'password', password_confirmation: 'password', email: 'myname2411@mycompany-test.com', login: 'myname2411')
</pre>
Notice that the username contains the user count (2411), a hack to help me remember it later.

Next, verify that we have backups running regularly (I set them to run daily a few weeks ago):
<pre>
$ heroku pgbackups --app my-custom-app
ID    Backup Time                Status                                Size    Database
----  -------------------------  ------------------------------------  ------  -----------------------------------------
b001  2014/07/28 16:47.56 +0000  Finished @ 2014/07/28 16:48.10 +0000  13.2MB  HEROKU_POSTGRESQL_CYAN_URL (DATABASE_URL)
a002  2014/07/31 04:15.10 +0000  Finished @ 2014/07/31 04:15.27 +0000  13.2MB  DATABASE_URL
a003  2014/08/01 04:28.41 +0000  Finished @ 2014/08/01 04:29.02 +0000  13.2MB  DATABASE_URL
a004  2014/08/02 04:15.45 +0000  Finished @ 2014/08/02 04:16.01 +0000  13.2MB  DATABASE_URL
a005  2014/08/03 05:23.54 +0000  Finished @ 2014/08/03 05:24.07 +0000  13.2MB  DATABASE_URL
a006  2014/08/04 05:28.25 +0000  Finished @ 2014/08/04 05:28.50 +0000  13.3MB  DATABASE_URL
a007  2014/08/05 04:16.15 +0000  Finished @ 2014/08/05 04:16.37 +0000  13.3MB  DATABASE_URL
a008  2014/08/06 05:45.21 +0000  Finished @ 2014/08/06 05:45.35 +0000  13.3MB  DATABASE_URL
</pre>

Looks like we have a bunch of daily backups.

Next, capture a backup of the database:
<pre>
$ heroku pgbackups:capture --app my-custom-app

HEROKU_POSTGRESQL_CYAN_URL (DATABASE_URL)  ----backup--->  b002

Capturing... done
Storing... done

</pre>
Then, verify that the backup exists:
<pre>
$ heroku pgbackups --app my-custom-app
ID    Backup Time                Status                                Size    Database
----  -------------------------  ------------------------------------  ------  -----------------------------------------
b001  2014/07/28 16:47.56 +0000  Finished @ 2014/07/28 16:48.10 +0000  13.2MB  HEROKU_POSTGRESQL_CYAN_URL (DATABASE_URL)
a002  2014/07/31 04:15.10 +0000  Finished @ 2014/07/31 04:15.27 +0000  13.2MB  DATABASE_URL
a003  2014/08/01 04:28.41 +0000  Finished @ 2014/08/01 04:29.02 +0000  13.2MB  DATABASE_URL
a004  2014/08/02 04:15.45 +0000  Finished @ 2014/08/02 04:16.01 +0000  13.2MB  DATABASE_URL
a005  2014/08/03 05:23.54 +0000  Finished @ 2014/08/03 05:24.07 +0000  13.2MB  DATABASE_URL
a006  2014/08/04 05:28.25 +0000  Finished @ 2014/08/04 05:28.50 +0000  13.3MB  DATABASE_URL
a007  2014/08/05 04:16.15 +0000  Finished @ 2014/08/05 04:16.37 +0000  13.3MB  DATABASE_URL
a008  2014/08/06 05:45.21 +0000  Finished @ 2014/08/06 05:45.35 +0000  13.3MB  DATABASE_URL
b002  2014/08/06 20:10.11 +0000  Finished @ 2014/08/06 20:10.42 +0000  13.3MB  HEROKU_POSTGRESQL_CYAN_URL (DATABASE_URL)
</pre>

It's the last backup on the list, 'b002'.  Next, restore the backup onto the empty test database.
<pre>
$ heroku pgbackups:restore HEROKU_POSTGRESQL_GREEN_URL b002 --app my-custom-app

HEROKU_POSTGRESQL_GREEN_URL  <---restore---  b002
                                             HEROKU_POSTGRESQL_CYAN_URL (DATABASE_URL)
                                             2014/08/06 20:10.10 +0000
                                             13.3MB

 !    WARNING: Destructive Action
 !    This command will affect the app: my-custom-app
 !    To proceed, type 'my-custom-app' or re-run this command with --confirm my-custom-app

> my-custom-app

Retrieving... done
Restoring... done
</pre>
Next, promote the test database, telling Heroku to direct requests there.
<pre>
$ heroku pg:promote HEROKU_POSTGRESQL_GREEN_URL --app my-custom-app
Promoting HEROKU_POSTGRESQL_GREEN_URL to DATABASE_URL... done
</pre>
To verify that this database is operational and valid, fire up another Rails console.
<pre>
$ heroku run rails c --app my-custom-app
Running `rails c` attached to terminal... up, run.5324
Loading production environment (Rails 3.2.18)
irb(main):001:0> User.count
   (2.6ms)  SELECT COUNT(*) FROM 'users'
=> 2412
irb(main):002:0> User.last
  User Load (3.9ms)  SELECT 'users'.* FROM 'users' ORDER BY 'users'.'id' DESC LIMIT 1
=> #< id: 2435, login: 'myname2411', email: 'myname2411@mycompany-test.com'>
</pre>
The user count is 2412, one more than the production database was before I created my user.  The user is there, too.

I also verified through the UI that the checksum user existed (you must turn maintenance mode off to do this, of course).  If you want to skip this step, continue by promoting the production database:
<pre>
$ heroku pg:promote HEROKU_POSTGRESQL_CYAN_URL --app my-custom-app
Promoting HEROKU_POSTGRESQL_CYAN_URL to DATABASE_URL... done
</pre>
And disable maintenance mode:
<pre>
$ heroku maintenance:off --app my-custom-app
Disabling maintenance mode for my-custom-app... done
</pre>
Delete your test database and the test is complete.

Heroku has been a great vendor so far, with responsive customer service, but I don't take anything for granted when it comes to the database.  Completing this process was a valuable step in moving forward with the platform.
")

Post.create!(title: 'Code Club',
url_slug: 'code-club',
created_at: 'Mon, 18 Aug 2014 15:50:21 +0000',
body: "At Rails Conf 2014, I watched a talk by Saron Yitbarek called <a href='http://www.confreaks.com/videos/3342-railsconf-reading-code-good'>Reading Code Good</a>.  Saron shared a story (and great slides) about creating a weekly code-reading club with some fellow Flatiron School alums.

It's an excellent idea.

I read code all day, but a lot of it is skimming.  With Ruby it's easy to get a sense of what a program does without exactly understanding each action.  That level of engagement works generally, but it fails in the face of a complex problem.  I want to get better at reading code.

With this in mind, a friend and I decided to try making our own code club.  We called it: 'Code Club'.

For our guiding principles, we copied Saron's list almost verbatim.  Here's what we agreed on:

<strong>Guidelines</strong>

* Pick a manageable code base (<100 LOC).  Active reading is tiring and we want to be able to focus.
* Code should be exemplary.  We want to see the best practices the industry has to offer.
* Pick a tour guide.  Somebody has to lead.  In the spirit of pair programming, I am probably going to lead for the foreseeable future because I have less experience.
* Interact with the code.  We both have IRB, project documentation, Ruby documentation, search engines, and Stack Overflow ready to go.  If we don't understand something, we will run actual examples until we do.

Where did we find our code?  This is where Github is great, because you can search repositories by language, size, 'stars', forks, and more.

The one hundred lines requirement was a challenge, because it's difficult to find any code of significance that is that small.  In the end we relaxed that requirement to allow slightly larger files.  We also agreed that it was okay to choose a single file with around one hundred lines, even if it is part of a larger project (like Rails).

The project we looked at was the Ruby gem <a href='https://github.com/thoughtbot/cocaine'>Cocaine</a>.  Cocaine is maintained by the team at Thoughtbot, who bill it as 'a small library for doing (command) lines.'  We chose the gem because it met our guidelines and is common to many Rails applications.

The file we read was <a href='https://github.com/thoughtbot/cocaine/blob/master/lib/cocaine/command_line.rb'>lib/cocaine/command_line.rb</a>, one hundred and seventy lines of Ruby code that do most of the heavy lifting for the gem.  It took about an hour to read.

Conclusion: I learned a lot.  Here are some of the concepts we covered, some new and some I'd forgotten, along with the best explanation I can give for each.

<strong>The Ruby 'detect' method</strong>.  Passes each entry in <em>enum</em> into a block, and returns the first value for which the block is not false.  If the block is never not false, it calls <em>ifnone</em> and returns the result if it is specified, or else returns nil.

<strong>The Ruby =~ operator</strong>.  A regular expression that takes the pattern on the right, and if there is a match to the variable on the left, returns the position of the start of the match, or else returns nil.

<strong>The Ruby 'dup' method</strong>.  Produces a shallow copy of an object, without the objects it references.  Different from 'clone' method because it duplicates the object but not its internal state.

<strong>The Ruby 'tr' method</strong>.  Takes arguments 'p1' and 'p2' and returns a copy of the string where 'p2' replaces 'p1'.  An example:
<pre>
'foobar'.tr(bar', 'baz')      #=> 'foobaz'
</pre>

When you slow down and actively read something, you learn.  This meeting gave me a deeper understanding of this gem and the Ruby language.  Code Club was fun and I highly recommend something similar to anybody who wants to improve their skills.  Thanks to my code partner for your time, Saron for the idea, and Thoughtbot for maintaining this useful gem.")

Post.create!(title: 'Code Club: Rails Console',
url_slug: 'code-club-rails-console',
created_at: 'Tue, 19 Aug 2014 18:25:52 +0000',
body: "Another week, another showdown in the <a href='http://worth-chicago.co/code-club/'>Code Club</a>.

Still being challenged by the one-hundred line requirement.  We keep it (generally) because it seems like a reasonable goal for an hour of time.

This week we decided to get into Rails, with the 'console' command.  The Rails console is a tool for interacting with the database using all the power of Rails.  The file <a href='https://github.com/rails/rails/blob/master/railties/lib/rails/commands/console.rb'>rails/railties/lib/rails/commands/console.rb</a> is one-hundred and thirteen lines of Ruby code that create most of this functionality.

Here are some concepts we explored during our meeting, and my description as I attempt to grok:

<strong>OptionParser</strong>.  Required in the first line of the file, OptionParser is a Ruby class for command-line analysis.  The big benefit I see to using this Class is that it allows you to specify an argument and explain how to handle it in one place. Explained in detail <a href='http://ruby-doc.org/stdlib-2.1.2/libdoc/optparse/rdoc/OptionParser.html'>here</a>.

<strong>class << self</strong>.  Opens up the singleton class of 'self', allowing you to specify the behavior of methods called on that specific object.  You can then redefine methods for whatever the current 'self' object is.

<strong>The Ruby 'splat' (*args) operator in a method definition</strong>.  Allows the method to take any number of arguments.

<strong>Ruby 'rescue'</strong>.  I forgot that 'rescue' can take an argument like 'LoadError', which will only run the code for that specific type of error.

<strong>exit(0), exit(1), and exit(127)</strong>.  All of these allow you to break from a program and convey a status to other programs.  Roughly, exit(0) == command succeeded, exit(1) == catchall for general errors, exit(127) == command not found.  A few more: exit(2) == misuse of shell, exit(126) == command invoked but cannot execute, and exit(130) == script terminated by CTRL-C.

Anything Rails-related is gigantic, so it's hard to not feel like we just scratched the surface during out meeting.  But that is part of this process.

The big breakthrough was a general agreement that we both want to know a lot more about Rack.  Rack is an important part of the stack, but it's something I haven't had to deal with or really understand.   This week we will be reading <a href='https://github.com/rack/rack'>rack/rack</a> and trying to pick a point of entry for some active code reading.

Thanks to my code partner, the Rails core team for maintaining this important file, and Google Hangouts for facilitating the club meeting.
")

Post.create!(title: 'Vim or Bust',
url_slug: 'vim-or-bust',
created_at: 'Wed, 20 Aug 2014 21:26:12 +0000',
body: "Starting with this blog post, I will be using Vim as my primary text editor.

When I started programming, I was on a Windows machine.  I used Windows Notepad at first, then moved to Notepad++.  This was my first text editor with some real features, and I still think it's a good choice for basic functionality.

When I started programming full-time, I learned Vim.  It was installed on my machine, my coworkers used it, and we had standalone Linux servers so it was a necessity.

I soon gave up on Vim.  There was a lot of change happening at that time; I was learning Rails, Linux, Postgres, and the architecture of a complex Rails app all at once.  People who say Vim is easy or that they choose it because they are 'lazy' forget how steep the initial learning curve can be.  It's a different way of typing.

For the past year, I have been using Sublime Text 2 for writing code, Vim for server maintenance, quick fixes, and commit messages, and Meld for git comparisons.  I don't like using multiple programs, but each seems pretty good at its specific function.

I have always known that Vim is the best of the three, for me.  Watching a skilled Vim user write code is a humbling experience.  They type at a speed faster than they can think.  It's almost as though their brain is being downloaded straight into the computer.  Most of my mentors and programming heroes choose Vim.  A lot of the Rails shops I respect are 100% Vim.  I have always believed I would someday switch to Vim, when I had 'the time'.

Of course, we never get such a luxury.  So today, I'm going to start using only Vim.

I have a one week plan in place to make this happen.  Here's the gist:

* Install basic <a href='http://www.github.com/jwworth/dotfiles'>dotfiles</a> (done)
* Remap 'ESC' and 'Caps Lock' (done)
* Remove Sublime Text from my Unity launcher (done)
* Complete the Vim tutor (done)
* Complete Vim Adventures (done, at least the free part)
* Print out and laminate a Vim graphical cheat sheet (done)
* Read Vim 'Getting Started' 'Editing Effectively' from :help
* Read all of the Vim resources from one of my favorite repos, vhf/free-programming-books
* Play some <a href='http://play.typeracer.com'>TypeRacer</a> to get my speed up</a>
* Dig into :help
* Repeat

I'm not starting from zero; I use Vim every day.  What's changing is that I'm going to use it for all those tasks I didn't want to use it for before: feature building, git comparisons, random notetaking.  I'm taking away any other option.

It's not going to be easy, but I think it's got to happen.  I hope this experiment will make me a faster, better programmer.")

Post.create!(title: 'Rails Pull Request #16603',
url_slug: 'rails-pull-request-16603',
created_at: 'Fri, 22 Aug 2014 03:42:30 +0000',
body: "Yesterday I made my second <a href='https://github.com/rails/rails/pull/16603'>contribution</a> to Rails.  Here's how it happened.

I had been looking for ways to contribute.  I use Rails for work, attended my first Rails Conf this year, and am a fan and proponent of the framework.  I think Rails is a powerful tool for building all kinds of web applications.

I was browsing the Github Issues page for the project, and noticed a call for contributions to the Rails 4.2 release notes.  My first Rails contribution was to the 4.1 release notes, so this seemed like a good chance to get involved again.

To start work on a contribution, I opened my local fork of Rails and updated my master branch:
<pre>
$ git fetch upstream
$ git merge upstream/master
</pre>

I like 'fetch' versus 'pull'.  It lets me compare changes prior to merging and avoid weird merge commits.

Once my branch was updated, I started reading through the release notes.  It was interesting to see what changed.  I look forward to seeing the notes about Adequate Record, which are currently unwritten.

Because of the contribution request, I was also searching for ways to improve the spelling, grammar, and syntax.

I like editing, and I'm using Vim 100% these days, so this soon devolved into me trying to augment my brain with Vim technology. I picked up a tool in the process, Vim spell checking:
<pre>
:setlocal spell :wqspelllang=en_us
:set background=dark
</pre>
This turned on spell error highlighting for US English, and set the background coloring to 'dark'.  With my dotfiles, this identified misspelled or foreign words throughout the file, and changed the coloring so the highlighting and text were not the same color.

I didn't find any obvious spelling errors, and soon realized that a careful spell check was probably one of the steps the core team performed before opening up the file for general contributions.

I did find a grammar error, however: the word 'does' where the word 'do' should have been.  It's a relevant issue because this file gets converted into a heavily trafficked public website.

I made my edit, stashed it on a 'task' branch, pushed it to Github, opened a pull request, and saw it merged into the project within minutes I love how responsive the Rails core team is.  I believe it's one of the reasons that Rails has been so successful.

Thanks to the Rails team for this exciting new release.  I look forward to building a new test application with it soon, and continuing to work on the release notes.
")

Post.create!(title: 'Vim Cheat Sheet',
url_slug: 'vim-cheat-sheet',
created_at: 'Fri, 22 Aug 2014 15:56:22 +0000',
body: "The Vim adventures continue.  Today I started reading through the 'help' section, which is vast and full of surprising ideas.  Starting to see why people like this editor so much.  It's a blank slate that you can make into whatever you want.

Vim starts from the assumption that users want no features that they haven't chosen to enable.

One thing I did yesterday was acquire a 'Vim Cheat Sheet'.  There are many of these on the internet; here is a <a href='http://www.viemu.com/vi-vim-cheat-sheet.gif'>good one</a>.  I like this one because it's visual, rather than a text list of commands.  I feel like I'm more apt to use it and memorize it.

Yesterday I printed out this image, took it to the Fedex store near my office, and had it trimmed to size and laminated.  It's next to my keyboard as I type.

The simple act of printing something out and having it laminated, for some reason, is a trigger for me that it's important.  I've already invested thirty minutes in this, so it must be worth something.  I'm using the 'sunk cost fallacy' to my advantage.

I did a Lean course a few years ago, and one concept that stuck with me was the visual workplace.  Exemplified by a Toyota Production System tool called 'Kanban', the visual workplace is the idea that visual cues are more compelling than slides, charts, graphs, or the many other tools we use to represent data.

An example would be a shelf filled with important parts.  If you work at a PC repair shop, the shelf might be filled with boxes of RAM upgrade kits.  You don't want to run out of these, ever.  But you also can't afford to have too many (inventory), because you have limited shelf space and they become obsolete as technology advances.  How do you know when to order more to stay in that ideal zone?

A rudimentary answer would be to calculate your average rate of consumption, figure out when you must order to never run out, and then place an order when you've dropped below that threshold.

The 'Kanban' solution would be to clear the shelf and stack your ten or fifteen or twenty boxes (or whatever that threshold is) on it, lined up.  You then mark where the boxes sit on the shelf, remove them, and paint that area a bright color.  Red would make sense to represent 'shortage'.

You then put the boxes back on the shelf and resume operations.  When anybody sees the red paint, it's time to place a repeatable order for a set quantity of kits.

The idea is to make the ordering process automatic and thoughtless.  You never run out and you never have surplus inventory.

That's what I hope this Vim Cheat Sheet will represent for me.  It should be a way to answer my novice Vim questions that is simple and visual.  No getting lost in the 'help' area or the vast black hole of the internet.

There is such a thing as too much information, and I think too much information was part of what sunk my first attempt at learning Vim.
")

Post.create!(title: 'Code Club: Rack and Rails Server',
url_slug: 'code-club-rack-and-rails-server',
created_at: 'Wed, 27 Aug 2014 23:20:40 +0000',
body: "This week in Code Club we explored Rack, the middleware of the Rails stack.  Rack is newsworthy of late due to a change in ownership, prompting inevitable questions about the future.  As Rails developers, we wanted to know what Rack really does.

We started with the README from the <a href='https://github.com/rack/rack'>rack/rack</a> repository.  Rack's team bills it as 'a modular Ruby webserver interface' and gives a nice overview.

Next we moved into the code.  In lib/ there is a file called 'rack.rb', which we read.  This file loads other files, comprising the core functionality of Rack.

We proceeded to one of those files, 'lib/rack/file.rb', Rack's tool for serving static files.  This was a challenging piece of code, because it referenced many other files and functions.

After struggling through, we took a break and returned to Rails.  I pulled a random file I was interested in, <a href='https://github.com/rails/rails/blob/4-1-stable/railties/lib/rails/commands/server.rb'>rails/rails/railties/lib/rails/commands/server.rb</a>, which tells Rails what to do when you enter the command 'rails server'.

Here are some concepts we reviewed while reading this file.

<strong>Ruby 'begin' and 'end'</strong>.  A wrapper that contains code that might raise an exception.  The keyword 'rescue' can be used to explain what to do with a certain exception; the keyword 'ensure' indicates that the code beneath it will always be executed.  This wrapper allows you to explain what the program should do in every scenario.

<strong>trap(:INT) { exit }</strong>.  Found on line 65, this method creates a trap for signals coming from the terminal.  For instance, if the user enters CTRL-C, this method will trap that command and terminate the program.

<strong>Ruby 'demodulize' method</strong>.  Removes the module part from the expression in a string.  A handy way to remove the last double colon and everything to the left of it.  For example:
<pre>
$ 'ActiveRecord::CoreExtensions::String::ThisClass'.demodulize # => 'ThisClass'
$ 'ThisClass'.demodulize # => 'ThisClass'
</pre>
<strong>The 'wrapped_app' method</strong>.  Touches the Rack app.

Exploring the Rails server code had an unexpected benefit: it taught me more about Rack.  The Rails server relies on several Rack modules to work.  Since Rack provides this functionality to other platforms besides Rails, this a clear example of 'convention over configuration'.

I would define Rack as a collection of modules that a platform uses to perform some of its core functions, including interacting with other levels of the stack.

The meeting wound down with a discussion about Vim.  My code partner also uses Vim, and shared some good repos for making Vim more powerful.  During our talk I learned how to paste from the system clipboard using CTRL-SHIFT-V.  Figuring out these simple commands has made this attempt at learning Vim more successful than previous attempts.

This was a good meeting.  We talked about the meeting format, our direction, and whether we could stray from reading code every meeting into other exercises like Code Katas or pair-programming an open source contribution.  We agreed to look into some simpler gems for the next meeting.

Thanks to the Rack and Rails core teams for maintaining these files, Google Hangouts for the connection, and Bram Moolenaar for building this awesome text editor.")

Post.create!(title: 'Scrapp',
url_slug: 'scrapp',
created_at: 'Thu, 04 Sep 2014 00:45:55 +0000',
body: "Today I am announcing the launch of <a href='http://scrapp.worth-chicago.co'>Scrapp</a>.  Scrapp is an app for tracking Scrabble games.  It allows you to record players, scores, and bingos, with more features in development.

My inspiration for this project was <a href='https://github.com/seanmoon/pivot-pong'>Pivot Pong</a> by Pivotal Labs.  Pivot Pong tracks inter-office ping-pong games, and it serves as a living example of how Pivotal Labs approaches problems.

Scrapp serves two similar purposes for me.  First, it tracks Scrabble games.  My family has played Scrabble for decades.  Many generations of notebooks, lost to time, have recorded our tradition.  I wanted better living through technology, so I built a modern web application that is more powerful than any notebook.

The second purpose is to show how I write code.  Scrapp incorporates the industry best practices I have learned:

* It is built with the right tools for the job: Ruby on Rails 4.1 and Ruby 2.1.0.
* It is test-driven with Rspec.
* It uses well-maintained gems, including 'haml' for readable embedded Ruby, 'rubocop' and 'haml-lint' for code style, 'seed_fu' for painless database seeding, 'bootstrap-sass' to hack my styling, and 'rack-wwwhisper' for access control.
* It is hosted on Heroku, with 'rails_12_factor' for Twelve Factor App compliance.
* It is monitored by New Relic and continuously tested and deployed by CircleCI.
* It is version-controlled with Git, built using the <em>Git Flow</em> branching model, with a dedicated master and develop branch and corresponding environments, and semantic version tagging.
* It has a README and a TODO with a list of repeatable build steps.
* It is open source.

Right now Scrapp is a CRUD app with basic functionality.  In-house quality assurance is underway, and it will be rigorous.

Side projects like this couldn't exist without the magic of open source.  I would like to thank the many open-source project creators who have provided my foundation, partners like Heroku, CircleCI, and New Relic, who offer indefinite trial versions, and everybody else who has helped me along the way.
")

Post.create!(title: '30 Days of Vim',
url_slug: '30-days-of-vim',
created_at: 'Tue, 23 Sep 2014 23:09:58 +0000',
body: "It's been a month since I started using Vim full-time; it's time to reflect.

To summarize, Vim is awesome, because it is fast, endlessly customizable, and fun. I am a convert and would like to thank all the passionate Vim-heads who proselytized to me so many times. Fair warning, I am now one of those people.

To start with, <strong>Vim is fast</strong>. My speed has at least doubled since switching. One big area of improvement has been the smaller tasks which I might call 'minor annoyances'. These are small bugs or syntax issues that are worth fixing but are low priority, tasks that I once postponed or ignored. With Vim, I just fix them, without much thought. Staying in one window is conducive to the coveted 'flow' state.

Vim is a mouse-free editor. I have nothing against mice; this year I bought a great vertical mouse. The mouse is a valuable tool that's been part of the PC package since almost the beginning.

But is it necessary? I'm skeptical. No matter how you set it up, taking your hand off the keyboard breaks concentration. Since switching to Vim I have tried to find a command or hotkey for every time I might use a mouse, speeding up my computing in general.

Second, <strong>Vim is endlessly customizable</strong>. Or, to be accurate, you must customize it! Vim is barely usable out-of-the box. My dotfiles, forked from a programmer lineage tracing back to Ryan Bates, make Vim awesome. I enjoy the fact that each setting is mine to choose, and I can make Vim as featured or austere as I want. More tools should be made that way.

My .vimrc adds line numbers, colors, file-specific indentation, a marker at 80 characters, and many other hacks. It's indispensable.

Third, <strong>Vim is fun</strong>. There is an inherent gamification with Vim that's addictive. When you watch another Vim user, you'll see commands you've never seen, that do the things you do better and faster.

Vim represents the endless pursuit of efficiency. The pursuit never ends, and I think that fact just appeals to the programmer mind.

A recent example for me was discovering macros. Pressing 'q' and then any other letter turns on a recorder that follows every action you take, until you press 'q' again. Pressing '@' followed by your chosen letter then executes the macro. And then pressing '.' will repeat the last command (the macro call in this example). This simple tool allows for some crazy automation. Press a single key and duplicate a half-hour of work? Sounds pretty good.

To reiterate the steps I took to learn Vim: read the documentation, experiment, and most importantly, remove any other option. Disable your arrow keys, disconnect your mouse, uninstall your favorite editor, and deal with being slow for a while. It won't last.

You might discover a new way of working that is faster, more personal, and fun.")

Post.create!(title: 'Ruby Symbol#to_proc',
url_slug: 'ruby-symbolto_proc',
created_at: 'Fri, 31 Oct 2014 18:39:25 +0000',
body: "Explore a Rails app, and you might see something like this:

<pre>
class People < ActiveRecord::Base

  def self.names
    find(:all).collect(&:name)
  end
end
</pre>

What is that <code>&:</code>, you might be wondering?  It's shorthand for this:

<pre>
class People < ActiveRecord::Base

  def self.names
    find(:all).collect { |p| p.name }
  end
end
</pre>

Often in Ruby, we are using a method that invokes a given block.  The methods <code>map</code>, <code>collect</code>, and <code>select</code> are just three examples.  To employ one of these methods, you might write something like this:

<pre>
[1,2,3,4,5].select { |num| num.odd? } #=> [1,3,5]
</pre>

This is fine, but there is a more concise expression, known as the Ruby <code>Symbol#to_proc</code> method.  From the Ruby 2.1.3 <a href='http://www.ruby-doc.org/core-2.1.3/Symbol.html'>documentation</a>, the <code>to_proc</code> method 'returns a Proc object which respond to the given method by sym.'  Here it is in action:

<pre>
[1,2,3,4,5].select(&:odd?) #=> [1,3,5]
</pre>

This takes the method named <code>odd?</code> as a symbol <code>:odd?</code> and invokes it as a Proc via the ampersand (<code>&</code>).  It's more concise, and gains value as you chain block-invoking methods.  Here is a contrived example to illustrate:

<pre>
[1,2,3,4,5].select { |num| num.odd? }.map { |num| num.to_f }.map { |num| num.to_s }
=> ['1.0', '3.0', '5.0']

[1,2,3,4,5].select(&:odd?).map(&:to_f).map(&:to_s)
=> ['1.0', '3.0', '5.0']
</pre>

Try integrating this technique into your Ruby app.

I was surprised to find out that this was a Ruby method rather than a Rails method.  Although my examples above are pure Ruby, this method gets really useful in Rails when you start chaining ActiveRecord associations.  To me, that's where its power is fully realized.

As it turns it, this was actually a Rails method first, starting with 1.1.1 and deprecated after 2.3.8.  It was then merged into Ruby itself.

This type of cross-pollination between Rails and Ruby is part of why both technologies remain relevant.  It takes communication between core teams and responsiveness to users to make the right call about where a feature belongs.  I think this was successful, because <code>Symbol#to_proc</code> is valuable and should be available to any Ruby framework, not just Rails.")

Post.create!(title: 'Week 48',
url_slug: 'week-48',
created_at: 'Wed, 26 Nov 2014 03:41:02 +0000',
body: "This week I learned a lot.

I picked up some new (old) slang, with the term 'bare metal'.  Here is a definition from the awesome <a href='http://www.catb.org/jargon/oldversions/jarg262.txt'>Jargon File</a>:
<em>
bare metal: n. 1. New computer hardware, unadorned with such snares and delusions as an {operating system}, {HLL}, or even assembler.  Commonly in the phrase `programming on the bare metal', which refers to the arduous work of {bit bashing} needed to create these basic tools for a new machine.  Real bare-metal programming involves things like building boot proms and BIOS chips, implementing basic monitors used to test device drivers, and writing the assemblers that will be used to write the compiler back ends that will give the new machine a real development environment.

2. The same phrase is also used to describe a style of {hand-hacking} that relies on bit-level peculiarities of a particular hardware design, esp. tricks for speed and space optimization that rely on crocks such as overlapping opcodes (or, as in the famous case described in Appendix A, interleaving of opcodes on a magnetic drum to minimize fetch delays due to the device's rotational latency).  This sort of thing has become less common as the relative costs of programming time and machine resources have changed, but is still found in heavily constrained environments like industrial embedded systems.  See {real programmer}.
</em>
There is an aura of legitimacy that surrounds bare metal programming.  Perhaps it is nostalgia for a bygone era, or respect for the challenge.  I respect it.  On the other hand, my work is built on many abstractions, and I appreciate that some of those hard problems have already been solved.

Another idea I've been exploring is Git commit messages.  There is no standard for these messages; they can be long or short, conservative in tone or filled with emojis.  That freedom of expression is part of the art of programming, but working in a collaborative environment, I want my messages to be as useful as the code they summarize.  So I've been trying to answer the following questions with my messages:

* What was the motivation for this change?
* What problem does it solve?
* If I am not also adding a test, why not?  (I want to challenge whatever assumption led me to not add a test)

Often these questions cannot be answered in one sentence; when that happens it's time to break into a second line.  A lot of programs (including Github) wrap messages before 80 characters, so if you want an entire message shown in as many situations as possible, be brief.

Right now a typical commit message from me looks something like this:
<pre>
Fixed everything that was broken. # 33 characters

Fixed all of the code and added many tests.  Took out a test
that looked cool but didn't test anything.  All of the things
work now!
</pre>

A third thing I learned was the Postgres method <code>coalesce</code>.  From the <a href='http://www.postgresql.org/docs/8.1/static/functions-conditional.html'>Postgres 8.1 Docs</a>:
<em>
The COALESCE function returns the first of its arguments that is not null. Null is returned only if all arguments are null. It is often used to substitute a default value for null values when data is retrieved for display...</em>

This is a SQL-standard method that is useful during data migrations.  Suppose you are copying a table from one database to another, but some of the columns in the first table have null values.  This is fine, unless the method used to execute the migration is <code>STRICT</code>.  When a method is <code>STRICT</code>, the strictness test checks that the variadic array, as a whole, is non-null.

In other words, when such a method receives a null value, it returns null, dumping all the other data.  This is where <code>coalesce</code> is useful.  For a column <code>name</code> in table <code>t</code>with some null values, use <code>coalesce</code>:
<pre>
new_name = coalesce(t.name, 1)
</pre>
This will assign <code>new_name</code> the value <code>t.name</code> unless it is null, in which case it will be assigned <code>1</code>.  This satisfies the strictness check, and allows all the other on-null data to be returned.

Respect the bare metal!
")

Post.create!(title: 'Week 49',
url_slug: 'week-49',
created_at: 'Fri, 05 Dec 2014 20:36:17 +0000',
body: "This week was awesome.  I learned every day and hope to bring some new ideas to my work.  A recurring theme was testing; some notes:

<strong>TDD - Helpful When Stuck </strong>

My respect for test-driven development grew a lot this week.  Watching part of an outstanding Jim Weirich talk, <a href='https://www.youtube.com/watch?v=983zk0eqYLY'>Roman Numerals Kata</a>, reminded me of the value of TDD.  My prescription for TDD success:

<em>Just start writing the tests.</em>

Write the tests, even when you are stuck.  I think people abandon TDD when staring at a blank screen, but that is when TDD is awesome.

Imagine you want a table showing some complex calculations, but you have no idea where to start. You can begin by writing an integration test.  Let's say you write a Cucumber feature that expects a certain number on the page.  Instead of trying to think all the way through to the working production code, just start writing the test.  Watch it fail.

The failure will guide you to defining the feature steps.  Again, instead of thinking about the goal, just write those steps.  Run the test again and allow it to fail.

The new failure will guide you again; the number you expect to be on the page is not there.  Now, here's the trick: instead of trying to immediately build a finished Rails table, <em>write the most naive code necessary to make the test pass</em>.  Don't build a method; just fill the table with some ignorant data that makes the test green.

What's the point?  The point is to validate all of the plumbing underneath, and that our test is hitting the view.  It builds confidence in the test.

From here you can add more test cases until the test is failing again.  This is called 'good red' and should be celebrated.  'Good red' gives us a path to building a working, tested model method that does what it's supposed to.

TDD can be vital when you are staring at a blank screen.

<strong>Cucumber Does Not Distinguish Given-When-Then</strong>

A sample Cucumber feature:
<pre>
Scenario: Describe the scenario
  Given one thing
  Given another thing
  When I open the window
  Then I should see something
  And I should see something else
</pre>
The words 'given', 'when', 'then', and 'and' give us context, and you might think they are meaningful to Cucumber.  They aren't.  Cucumber does not distinguish between them at all.

<a href='https://github.com/cucumber/cucumber/wiki/Given-When-Then'>Cucumber's Given When Then</a> explains this well.  My explanation is these words exist to allow readable pseudocode, understandable by we humans.  At the time of this writing Cucumber supports multiple languages for the keywords, including English, Japanese, Arabic, and Pirate.

As to the actual meaning of the words, Cucumber doesn't care.

<strong>Testing is Vast</strong>

Testing is vast.  It is a big enough subject to support entire careers in programming.

This week I listened to a talk about testing native Android apps, which is both difficult (thousands of devices multiplied by many OS releases) and not always cheap.  I learned about generative testing, a feature of Clojure that attempts to identify edge cases that would cause a method to fail.  I listened to a discussion about integration testing versus unit testing.  I enjoyed a talk about Ember and some of the test tools being developed there.

My conclusion is that testing is a massive subject.  It's bigger than any 'best practice', opinion, or sound bite.  There is a universe of tools and techniques, and finding the right combination for your project is an art.

Test on!")

Post.create!(title: 'Week 50',
url_slug: 'week-50',
created_at: 'Fri, 12 Dec 2014 17:13:16 +0000',
body: "This was an interesting week.  I worked on some open source projects, experimented with the Pure Data language, and learned some new Ruby methods.  Some notes:

<strong>Ruby + Ubuntu = Music</strong>

Last week I started reading <em>Practical Ruby Projects</em> by Topher Cyll.  This is a collection of thoughtful Ruby programs that touch a broad variety of CS topics.  If you are an intermediate Rubyist looking for fresh ideas, check it out.

I worked through Chapter 2, 'Making Music with Ruby', resulting in my <a href='https://github.com/jwworth/musica'>musica</a> repo.  This is a MIDI music player with a timer, metronome, and the ability to read sequences in time, as well as 'tap advance' each note.  It supports Linux, but isn't really useful yet out of the box.  My biggest divergence from Topher's source code was replacing the deprecated 'DL' library with 'Fiddle'.

This was a fun project.  It taught me about how Linux and Ruby can interact, and hearing music from Ruby code is awesome.  Next up: OS X compatibility and more features.

<strong>Pure Data</strong>

Another thing I explored was the Pure Data language.  Pure Data is a visual programming language created by Miller Puckette in the 1990's for building music and multimedia interfaces.

You can get it <a href='http://puredata.info/downloads/pd-extended'>here</a> through the 'Pd-extended' executable, which gives you Puckette's program plus 'available libraries, extensions, and documentation'.  Those with OS X Yosemite will also need the X11 server.

See the palette at top, left, for my customary 'Hello World!' program.  Yes, this is an actual Pure Data program.  It consists of four boxes: a 'Hello World!' message box, a 'print' box naming our method, and two versions of a 'bang' box allowing the user to fire at will.  Here is the console output from pressing either of those 'bang' boxes once:
<pre>
print: Hello World!
</pre>

How about some math?  I've made an addition program in the palette, top right.  This adds '40' and '2' together and returns the result in the bottom box.  The 't b b' box is a 'trigger' that tells the program how to add the numbers together.  There is a great series of videos on Youtube by Dr. Rafael Hernandez that explain some basic Pure Data ideas.

Building programs with Pure Data is much like connecting hardware in a rack, which feels intentional.

<strong>Ruby Methods</strong>

What happens when you type <code>String.methods</code> into IRB?  You see all public methods for that class.  I did that for strings and integers, and for each one I didn't know, I ran <code>help</code>, then the method name.  Here is a summary of what I learned:

.succ              =>    Increment strings and integers by one; alias 'next'
.pred              =>    Decrement integers by one (does not work on strings)
.gcd()             =>    Returns greatest common divisor (always positive)
.lcm()             =>    Returns least common multiple (always positive)
.gcdlcm()          =>    Returns an array with the results of .gcd and .lcm
.freeze            =>    Prevents further modification of an object.  Cannot  be undone
.frozen?           =>    Returns true if a method is frozen
.squeeze           =>    Returns a new string with duplicate letters removed.  If an argument is given, removes argument letters
.partition(str)    =>    Returns the first match of the argument, from the left
.rpartition(str)   =>    Returns the first match of the argument, from the right
I'm interested in the intersection of code and music, and hope to pursue that.  Thanks to everybody I worked with, paired with, and talked with this week, as well as Topher Cyll, Miller Puckette, and all who contributed to the Ruby help pages.")

Post.create!(title: 'Week 51',
url_slug: 'week-51',
created_at: 'Fri, 19 Dec 2014 21:36:09 +0000',
body: "It's getting cold in Chicago.  Luckily, programming is an indoor activity.

This week I wrote my first proper Ruby gem, then wrote two more.  The process was fun and I learned a lot.

<strong>Runge</strong>

My first gem is <a href='https://github.com/jwworth/runge'>Runge</a>.  The name is a mashup of the words 'Ruby' and 'munge'.  Here is a definition of 'munge' from <a href='http://www.catb.org/jargon/html/index.html'>The Jargon File</a>:
<em>
munge: /muhnj/, vt.
1. [derogatory] To imperfectly transform information.
. . .
</em>
My definition of munging is smashing data until useless, while maintaining its basic look and feel.  There are many applications for a data munge.

Runge performs a simple munge using Ruby.  The functionality is monkeypatched into the <code>String</code> class:
<pre>
self.split('').each_with_index { |x, i| x.succ! if i.odd? }.join
</pre>
For each word in the user input string, this increments every other letter by one, turning a word like 'whatever' into 'wiauewes'.  One iteration smashes your string.

I'd like to add an 'unmunge' function so the gem could be used for hobby crypto.  That is tougher than it sounds, because Ruby doesn't have an inverse method to <code>succ</code> for strings.  <code>pred</code> is the equivalent for integers but it doesn't work on strings.

Building Runge taught me how to build a test-driven gem, polish it, and publish it to Rubygems.

<strong>Three Ideas</strong>

Next came <a href='https://github.com/jwworth/three-ideas'>Three-Ideas</a>.  Three Ideas generates three random programming project ideas.  Some sample output:
<pre>
$ three-ideas
Video software written in Fortress
Utility software written in IMP
Word processors written in C
</pre>
The ideas are built from scraping Wikipedia for software types and programming languages.  Most are ridiculous.

<strong>Secret Santa</strong>

Remember Secret Santa?  You pass around a hat with everybody's name inside, each person draws a name, and then you purchase a gift for the person whose name you drew.  It's fun, but the setup is slow, because somebody always draws themselves, or two people draw each other, which isn't fun.

<a href='https://github.com/jwworth/secret_santa'>Secret Santa</a> solves this.  Run it, enter names, and you will get a random list and an image file.  Nobody can draw themselves, and no two people can draw each other.

Any time you need a round-robin assignment you can use Secret Santa.  I will be using it in 2015.

<strong>Command Chaining</strong>

Here is a cool trick.  With most shells you can run this:
<pre>
$ rake && git push && say 'upload complete'
</pre>
Each command runs, in order, unless the previous command fails.  It's awesome for common groups of commands like those above, provided you expect them each to pass.

Publishing gems with Rubygems is a joy.  Thank you to Rubygems.org, the maintainers of The Jargon File, Graphviz, and Wikipedia, and all my peers and mentors.")

Post.create!(title: 'Learning to Program',
url_slug: 'learning-to-program',
created_at: 'Thu, 22 Jan 2015 01:14:42 +0000',
body: "A few years ago, I wrote my first computer program. It was a line of JavaScript that assigned my name to a variable <code>name</code>, using the website Codecademy.

Today, I am a full-time programmer, and I love what I do. Programming is fun. It challenges my creativity, attention to detail, self-direction, and logical thinking. Writing code is empowering because it changes how you look at the world.

I entered this trade because somebody encouraged me to, and I try to bring that spirit into all my professional encounters. If you're interested, it's never been a better time to learn. The tools and community are better than ever.

I'd like to take a moment and list some of the resources that helped me get started. I started with Ruby, but there is an equivalent version of each of these tools in all the major languages. I am grateful for these resources and they are part of why I am able to program.

<strong>Codecademy</strong>

I started with the website <a href='http://codecademy.com'>Codecademy</a>. Codecademy is a free in-browser code school with simple, fun courses in JavaScript, JQuery, Ruby, and Python. It was recommended to me as a starting point, and it serves that purpose well; there is no setup and the instructions are explicit.  You can open a tab right now and start learning.

Before long I found that I loved programming. When someone asks me about learning to program, I point them to Codecademy.  It's an excellent test; if they don't come back excited, neither of us has spent a lot of time talking about something they don't like. If they do come back, awesome; I then recommend more challenging material. I completed the Codecademy JavaScript, Ruby, HTML/CSS, and JQuery tracks in a few weeks, and started looking for the next challenge.

<strong>Learn Ruby the Hard Way</strong>

The first book I read about programming was <em><a href='http://learncodethehardway.org/ruby/'>Learn Ruby the Hard Way</a></em> by Zed Shaw. The author presents a much harder version of the profession; step zero is called 'The Setup' and requires finding your terminal, installing Ruby, and downloading a text editor. Each of those steps can seem daunting to a newbie, but it's a very logical approach.

<em>Learn Ruby the Hard Way</em> emphasizes writing code rather than analyzing it, and introduces testing. I got a lot out of it, and my first real program of any significance was a command line game as an assignment for the book (still on Github).

<strong>Project Euler</strong>

I discovered <a href='http://projecteuler.net'>Project Euler</a> because I don't like math and realized that I would need to develop that skill. Project Euler is an incredible series of progressively harder math problems that can be solved by any program you choose, with one caveat: the program must return the answer in under a minute. This negates most brute force solutions. Project Euler teaches the kind of critical thinking that programming demands.

Note: this site had a security breach last year, causing the immediate suspension of the social features of the site.  This doesn't stop anyone from solving the problems, however; you just won't get any badges.

<strong>Meetups</strong>

One of my strongest recommendations for someone interested in programming is to attend Meetups.

<a href='http://www.meetup.com'>Meetups</a> are free meetings in your area based on interests.  Every major programming language and methodology has a group in a city like Chicago. My first Meetup was with <a href='http://www.meetup.com/laruby'>LA Ruby</a>, and I continue with the awesome <a href='http://www.meetup.com/chicagoruby'>ChicagoRuby</a>.  In the meantime I've attended dozens of other events, on topics such as Vim (<a href='http://www.meetup.com/vim-chicago'>Vim Chi</a>), Go, HTML, JavaScript, Dev Ops, and technical culture.

Why do I do this? There are three reasons:

* Culture: you get to hang around other programmers and learn how they talk and act.  This is crucial in the beginning because there are so many ideas to learn.
* Learning: you can hear current presentations on subjects relevant to your field. A lot of Meetup presentations are used as test runs for conference presentations, so you will hear a lot of big ideas there for free.
* Networking: Meetups are where the programmers are (if you happen to be looking for a job).

Meetups are also a great gauge of your progress. At first you will feel lost, but as you progress you will understand more and gain better insight from each presentation.  I found that encouraging.

<strong>Github (Write and Push Code)</strong>

In order to get good at writing code, you have to write a lot of it. Every great app is the successor to a long lineage of smaller, not-as-great apps. There is no shortcut.

If you like programming, and have any interest in doing it full-time, sign up for a <a href='https://github.com/'>Github</a> account and start pushing your code there immediately. Every day, whatever you write, push it to a public repository. It shows passion and commitment. Github (and a few other sites like it) is the de facto programming resume of 2015; not having an account or code to show is no longer an option.

Yes, it can be scary publishing your work to the internet for all to see. However, I think it will hold you accountable to keep writing every day, and you'll be motivated to make your code as good as it can possibly be. Defending your work and learning from constructive criticism is part of being a programmer.

<strong>Other Media</strong>

<a href='http://www.railscasts.com'>Railscasts</a> and <a href='http://www.confreaks.com'>Confreaks</a> are two of my favorite sites for video learning. Beyond technical skills, programming videos also help you learn some of the culture and lingo of programming. There are also some podcasts out there; if podcasts help you learn, go for it. Books are great and can help you explore a topic more deeply, but they age quickly and are also pretty heavy to carry around.

<strong>Persistence</strong>

Don't give up! Programming is not easy.  It gets easier, sort of. Learn to embrace feeling confused and practice pushing through the confusion. The results are worth it.

Code on!")

Post.create!(title: 'Week 4: The DOM',
url_slug: 'week-4-the-dom',
created_at: 'Fri, 23 Jan 2015 21:57:39 +0000',
body: "This week I've been learning more about the Document Object Model, known as the DOM. I'd like to summarize my thoughts, with the goal of explaining what the DOM is, why it is relevant today, and why it can seem difficult to understand. I'd also like to share resources I found informative.

<strong>What is the DOM?</strong>

The DOM is a cross-browser, language-independent convention for representing and manipulating objects in HTML.

When an internet browser receives the HTTP response it needs to build a web page, it parses that response into a hierarchy known as the DOM tree  This tree is a series of nodes that represent the nested nature of HTML. From here, JavaScript can be used to dynamically interact with any node on the tree.

<strong>Why is the DOM relevant?</strong>

The DOM is one of the most important features of the modern internet. Anytime a script is changing elements on a web page, it's referencing the DOM.

The early internet did not feature any of the fast, dynamic content we see today. Instead, it was a delivery system of static HTML pages from a server to a client.

Eventually, the demand for dynamic content increased, and software engineers worked hard to create products to satisfy that demand. The DOM rose from that era as a way to maintain and represent the state of a user's browser.

In 2015, JavaScript and its frameworks are more popular than ever, suggesting that the importance of the DOM in web development will only increase.

<strong>Why is the DOM difficult to understand?</strong>

In a tech talk at Yahoo! in 2006, Douglas Crockford, one of the key architects of modern JavaScript, one called the DOM a 'vast source of incompatibility, pain, and misery.'

Few features of the web development stack are more vaguely understood than the DOM. To understand why, you must consider the history of the DOM.

The DOM was born during the browser wars of the 1990's, as Microsoft and Netscape battled for market share. Both companies chased users by building more powerful, feature-rich, proprietary browsers. Standardization would have hurt both businesses, because a superior version of the DOM was seen as a competitive advantage. Different standards were developed, maturing separately for a decade.

Today, the browser market is more fragmented than ever. Luckily, the major players are working with the W3 to standardize and document the DOM. However, I think that the legacy of incompatibility and secrecy has given the DOM a confusing reputation.

<strong>Further Reading</strong>

The DOM is a massive subject; here is a short list of related resources I recommend:

* <em>13/21 JavaScript Fundamentals - Understanding the Document Object Model</em> by Bob Taber (available <a href='https://www.youtube.com/watch?v=LsY2PsPKckU&feature=youtu.be'>here</a>). Consider this short video a starting point.
* <em>An Inconvenient API - The Theory of the DOM</em> by Douglas Crockford (available <a href='https://www.youtube.com/watch?v=Y2Y0U-2qJMs'>here</a>). This is the 2006 talk at Yahoo! I mentioned above. It is the most comprehensive, interesting overview of the subject I found, explained by one of the leading authorities on front-end development.
* <em>DOM it, Forgive, Forget, Embrace</em> by Cody Lindley at HTML 5.tx (available <a href='http://www.confreaks.com/videos/2218-html5tx2013-dom-it-forgive-forget-embrace'>here</a>). This talk does a great job explaining the challenges of the DOM, and how they can be overcome with today's in-browser development tools.
* <em>HTTP: The Definitive Guide</em> by David Gourley. This book is about HTTP, not the DOM, but it is an excellent read. If you have any confusion about all of the steps leading up to and supporting DOM manipulation, this is for you.

If you are interested in what is possible using the DOM, check out <a href='http://adarkroom.doublespeakgames.com/'>A Dark Room</a>. Beyond being a fun throwback, it's a reminder of what can be done exclusively in the browser.

Thanks to all these content providers, and everyone I talked and paired with this week.")

Post.create!(title: "My First Ember.js App",
url_slug: 'my-first-ember-js-app',
created_at: 'Sat, 07 Feb 2015 15:09:49 +0000',
body: "The last two weeks I've been diving into JavaScript frameworks, culminating in my first Ember.js app. It's called Ember CRM, and you can see it here:

<a href='http://ember-crm.worth-chicago.co/'>http://ember-crm.worth-chicago.co</a>

Here's the source:

<a href='https://github.com/jwworth/ember-crm'>https://github.com/jwworth/ember-crm</a>

I built it with Vic Ramon's Ember Tutorial (<a href='http://ember.vicramon.com'>http://ember.vicramon.com</a>). Vic's tutorial is outstanding. He breaks down the internals of an Ember project with a focus on quickly building a working prototype.  I highly recommend it.

Here is the stack:

* Rails 4.2 and Ruby 2.2.0
* CoffeeScript
* Ember-Rails
* Postgres 9.4
* Ember-Data for frontend-backend communication
* Emblem.js for tidy views
* Puma development web server
* Ffaker for database population
* Heroku hosting

I also used <a href='https://github.com/tpope/vim-projectionist'>Vim Projectionist</a> for the first time on this project. This is a Tim Pope vim plugin that lets you create custom shortcuts for your JavaScript project files. I used it to rapidly navigate and generate boilerplate.

Another resource I leveraged was 5by5's 'Ruby on Rails Podcast #179 with Trek Glowacki - Learning Ember' (<a href='http://5by5.tv/rubyonrails/179'>http://5by5.tv/rubyonrails/179</a>). Trek is an Ember core team member and shares the past, present, and future of Ember, as well as some anecdotes about his career as a code-documenter and passionate early adopter. I enjoyed it.

If you're interested in JavaScript frameworks, check out Ember. Ember artfully mixes the ease of Rails' convention over configuration with the front-end shine of JavaScript. Love or hate them, JavaScript web apps are not going away. It's a great time to learn Ember, because the platform is maturing, the core team seems forward-thinking, and better tutorials and documentation appear every day.

Thank you to Vic Ramon, Tim Pope, 5by5, Trek Glowacki, all the open source teams and service providers listed in the stack above, and everyone I paired and talked with these past two weeks.")

Post.create!(title: 'N + 1 Problem and N Plus',
url_slug: 'n-1-problem-and-n-plus',
created_at: 'Sun, 22 Feb 2015 08:30:20 +0000',
body: "Recently, I was thinking about the N + 1 problem.

N + 1 is a performance issue in a web application, where a method call unleashes a torrent of database queries. Take this method, which loads all users:

<pre>
def index
  @users = User.all
end
</pre>

Simple enough, but call some records in the view associated with each user, such as 'friends' and 'reviews', and Rails builds a SQL query for each user, each user's friends, and each user's reviews. This is redundant, and with a big database, unacceptably slow. This is an N + 1 problem.

After some reading, I decided that the best way to learn how to fix an N + 1 problem would be to fix one. I started building a web app.

How do you create a slow program, on purpose? It should have several associated records, a large data set, and a controller that carelessly dumps all that data into a view. But it also needs to be measurable, so it should be simple, easy to run, and devoid of other factors that could affect performance like styling and scripts.

The result is 'N Plus': (<a href='https://github.com/jwworth/n-plus'>https://github.com/jwworth/n-plus</a>). 'N Plus' earns its name, featuring a substandard page load time of about seven seconds.

In the users controller for 'N Plus', I tested and measured several common Rails solutions. Ultimately, the README for this app became its own blog post. I'll let that document speak for itself.

<a href='https://github.com/jwworth/n-plus/blob/master/README.md'>README</a>

Thank you to everybody who gave me feedback during this project.
")
end
