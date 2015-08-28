# Ringc

Ringc executes commands with rich stats.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ringc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ringc

## Usage

```irb
>> require "ringc"
>> result = Ringc.ring("ls -a")

>> result.success?
=> true

>> puts result.stdout
.
..
.git
.gitignore
.rspec
.travis.yml
Gemfile
Gemfile.lock
README.md
Rakefile
bin
lib
ringc.gemspec
spec
=> nil

>> puts result.stderr

=> nil

>> result.real
=> 0.53631

>> result.total
=> 0.48

>> result.utime
=> 0.39999999999999997

>> result.stime
=> 0.08
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nownabe/ringc.

