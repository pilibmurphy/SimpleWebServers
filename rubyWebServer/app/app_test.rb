require "test/unit/assertions"
require "test/unit"
include Test::Unit::Assertions
require_relative 'modulo'

class AppTest < Test::Unit::TestCase
    
    def test_modulo0
        mod = Modulo.new
        assert_equal(0, mod.modulo(11,1))
    end

    def test_modulo1
        mod = Modulo.new
        assert_equal(1, mod.modulo(11,2))
    end

    def test_modulo2
        mod = Modulo.new
        assert_equal(2, mod.modulo(11,3))
    end

  end