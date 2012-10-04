# Drafteable

Drafteable is a super simple and opinionated ActiveRecord model draft
behavior encapsulation:

A drafteable model should:
    - Provide a boolean field as a flag for its draft status.
    - Provide methods to check draft or published status.
    - Provide methods to change draft or published status.

## Installation

Add this line to your application's Gemfile:

    gem 'drafteable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install drafteable

## Usage

On your ActiveRecord model add

    acts_as_drafteable

Then you get published?, draft? (for checking the state) and publish!,
draft! (for changing the status).

Note that calling draft! will save the model skipping validations.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

You've got test under spec/ and `bundle install` should take care of
all gem dependencies for development.

## TODO

1. Write generator to create migration with draft field on model.
