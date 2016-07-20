require "minitest/autorun"
require "minitest/pride"
require "pry"

class Solver < Minitest::Test
  def setup

  end

  def solver 
  	File.open("./test.txt", "r") do |f|
  		f.each_line do |line|
  			puts line
  		end
  	end
  end

  def test_blank
  	solver
    assert_equal 1, 1
  end

end