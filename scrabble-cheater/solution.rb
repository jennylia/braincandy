require "minitest/autorun"
require "minitest/pride"
require "pry"

class Solver < Minitest::Test
  def setup
    @words = File.readlines("/usr/share/dict/words").map(&:chomp).map(&:downcase)
    @blanktiles = ""
    @all_a = "a" * 7
    @all_b = "b" * 7
    @too_long = "z" * 10
  end

  def solver_brute_force(tiles)
  	ans = []

  	if (tiles.empty? || tiles.length > 8)
  		return ans
  	end

  	#if we are assuming that we can use a tile how many ever times we want

  	#generate all sorts of permutations for tiles
  	unique_tiles = tiles.chars.uniq.sort
  	tiles_combo = []
  	#let us try to use combination
  	for i in 1..unique_tiles.length
  		cur_combo = unique_tiles.combination(i).to_a
  		cur_combo.each do |c|
  			c = c.join
  			tiles_combo.concat(c.chars.permutation.map(&:join))
  		end
  	end

  	tiles_combo = tiles_combo.uniq.sort
  	tiles_combo.each do |t|
  		if @words.include?(t)
  			ans.push(t)
  		end
  	end

  	return ans
  end

  def test_blank
    assert_equal [] , solver_brute_force(@blanktiles)
  end

  def test_too_long
    assert_equal [] , solver_brute_force(@too_long)
  end

  def test_all_a
    assert_equal ["a"], solver_brute_force(@all_a)
  end

  def test_word
  	assert_equal ["a", "act", "at", "c", "ca", "cat", "t", "ta"], solver_brute_force("cat")
  end
end