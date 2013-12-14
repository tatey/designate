# Designate

A short hand for turning instance methods into a one-liner for service-type
classes.

## Installation

Add this line to your application's Gemfile

    gem 'designate', github: 'tatey/designate'

And then execute

    $ bundle

## Usage

Declare an instance method to become the designated method for
that class. Arguments are correctly passed to instance method
and initializer.

Example with a designated method that takes no arguments:

    class Generator
      extend Designate

      def initialize attributes = {}
        @attr1 = attributes[:attr1]
      end

      def generate
      end
      designate :generate
    end

    Generator.generate attr1: val1

Example with a designated method that takes arguments:

    class Generator
      extend Designate

      def initialize attributes = {}
        @attr1 = attributes[:attr1]
      end

      def generate arg1
      end
      designate :generate
    end

    Generator.generate val1, attr1: val2

Example with a designated method that takes a block:

    class Generator
      extend Designate

      def initialize attributes = {}
        @attr1 = attributes[:attr1]
      end

      def generate arg1, &block
      end
      designate :generate
    end

    Generator.generate(val1, attr1: val2) { 'blockval' }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run tests (`rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## Copyright

Copyright 2013 Tate Johnson. MIT LICENSE. See LICENSE.txt for details.
