# Lt::Lcms

[![Codeship Status for learningtapestry/lt-lcms](https://app.codeship.com/projects/b151f4e0-26f8-0137-ffc2-3e508df156a9/status?branch=master)](https://app.codeship.com/projects/330485)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lt-lcms'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install lt-lcms
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Docker

```shell
docker buildx build --platform linux/arm64/v8,linux/amd64 -t learningtapestry/lt-lcms:legacy --push .
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/learningtapestry/lt-lcms.

## License
The gem is available as open source under the terms of the [Apache License](https://github.com/learningtapestry/lcms-engine/blob/master/LICENSE).
