# Cuid2

Ruby implementation of [Cuid2](https://github.com/paralleldrive/cuid2).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add cuid2

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install cuid2

## Usage

First require it.

```ruby
require 'cuid2'
```

Generate a Cuid2 with call.

```
Cuid2.generate
=> "zw881lkfxx644yknviucss31"
Cuid2.call
=> "yra4dr2qteivp6kkur89gd11"
Cuid2.()
=> "cr6x94qpqagcgbay780xifun"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stulzer/cuid2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/stulzer/cuid2/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Cuid2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/stulzer/cuid2/blob/main/CODE_OF_CONDUCT.md).
