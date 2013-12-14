require 'designate/version'

module Designate
  # Declare an instance method to become the designated method for
  # that class. Arguments are correctly passed to instance method
  # and initializer.
  #
  # Example with a designated method that takes no arguments:
  #
  #   class Generator
  #     extend Designate
  #
  #     def initialize attributes = {}
  #       @attr1 = attributes[:attr1]
  #     end
  #
  #     def generate
  #     end
  #     designate :generate
  #   end
  #
  #   Generator.generate attr1: val1
  #
  # Example with a designated method that takes arguments:
  #
  #   class Generator
  #     extend Designate
  #
  #     def initialize attributes = {}
  #       @attr1 = attributes[:attr1]
  #     end
  #
  #     def generate arg1
  #     end
  #     designate :generate
  #   end
  #
  #   Generator.generate val1, attr1: val2
  #
  # Example with a designated method that takes a block:
  #
  #   class Generator
  #     extend Designate
  #
  #     def initialize attributes = {}
  #       @attr1 = attributes[:attr1]
  #     end
  #
  #     def generate arg1, &block
  #     end
  #     designate :generate
  #   end
  #
  #   Generator.generate(val1, attr1: val2) { 'blockval' }
  def designate method_symbol
    meth  = instance_method method_symbol
    arity = meth.arity
    define_singleton_method method_symbol do |*args, &block|
      class_args    = args.slice! arity..-1
      instance_args = args
      new(*class_args).public_send method_symbol, *instance_args, &block
    end
  end
end
