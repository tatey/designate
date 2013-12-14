require 'minitest/autorun'
require 'designate'

class DesignateNoArgumentTest < Minitest::Test
  class NoArgument
    extend Designate

    def initialize attributes = {}
      @attr1 = attributes[:attr1]
    end

    def main
      {attr1: @attr1}
    end
    designate :main
  end

  def test_calls_designated_method_without_initializer_arguments
    result = NoArgument.main

    assert_equal(result, {attr1: nil})
  end

  def test_calls_designated_method_with_initializer_arguments
    result = NoArgument.main attr1: 'attr1'

    assert_equal(result, {attr1: 'attr1'})
  end
end

class DesignateOneArgumentTest < Minitest::Test
  class OneArgument
    extend Designate

    def initialize attributes = {}
      @attr1 = attributes[:attr1]
    end

    def main arg1
      {arg1: arg1, attr1: @attr1}
    end
    designate :main
  end

  def test_calls_designated_method_without_initializer_arguments
    result = OneArgument.main 'arg1'

    assert_equal(result, {arg1: 'arg1', attr1: nil})
  end

  def test_calls_designated_method_with_initialize_arguments
    result = OneArgument.main 'arg1', attr1: 'attr1'

    assert_equal(result, {arg1: 'arg1', attr1: 'attr1'})
  end
end

class DesignateManyArgumentsTest < Minitest::Test
  class ManyArguments
    extend Designate

    def initialize attributes = {}
      @attr1 = attributes[:attr1]
    end

    def main arg1, arg2
      {arg1: arg1, arg2: arg2, attr1: @attr1}
    end
    designate :main
  end

  def test_calls_designated_method_without_initializer_arguments
    result = ManyArguments.main 'arg1', 'arg2'

    assert_equal(result, {arg1: 'arg1', arg2: 'arg2', attr1: nil})
  end

  def test_calls_designated_method_with_initialize_arguments
    result = ManyArguments.main 'arg1', 'arg2', attr1: 'attr1'

    assert_equal(result, {arg1: 'arg1', arg2: 'arg2', attr1: 'attr1'})
  end
end

class DesignateBlockArgumentTest < Minitest::Test
  class BlockArgument
    extend Designate

    def initialize attr
      @attr = attr
    end

    def main arg1, arg2, &block
      {arg1: arg1, arg2: arg2, block: yield, attr: @attr}
    end
    designate :main
  end

  def test_calls_designated_method
    result = BlockArgument.main('arg1', 'arg2', 'attr') { 'block' }

    assert_equal(result, {arg1: 'arg1', arg2: 'arg2', block: 'block', attr: 'attr'})
  end
end
