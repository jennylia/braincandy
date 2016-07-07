require "minitest/autorun"
require "minitest/pride"

class Solver < Minitest::Test
  def setup
    @words = File.readlines("/usr/share/dict/words").map(&:chomp).map(&:downcase)
    @blanktiles = ""
    @all_a = "a" * 7
    @all_b = "b" * 7
    @too_long = "z" * 10
  end

  def solver(tiles)
  	ans = []
  	if (tiles.empty?)
  		return ans
  	end

  	if (tiles.length > 8)
  		return ans
  	end
  end

  def test_blank
    assert_equal solver(@blanktiles), []
  end

  def test_too_long
    assert_equal solver(@too_long), []
  end

  def test_that_will_be_skipped
    skip "test this later"
  end
end