require 'minitest/unit'
require 'minitest/autorun'

#Much fun
#In for yield intoarce de fiecare data valoarea

def doubler(array)
	for i in array
		yield i * 2
	end
end

def multiplier(array, times)
	for i in array
		yield i * times
	end
end

def sum(array)
	s = 0
	array.each { |i| s += i }

	if block_given? 
		yield s
	else
		s
	end
end

class BlocksTest < MiniTest::Unit::TestCase
  def test_doubler
    a = [1,2,3]
    result = []

    doubler(a) do |value|
      result << value
    end

    assert_equal [2,4,6], result
  end

  def test_multiplier
    a = [1,2,3]
    result = []

    multiplier(a, 2) do |value|
      result << value
    end

    assert_equal [2,4,6], result

    result = []
    multiplier(a, 3) do |value|
      result << value
    end

    assert_equal [3,6,9], result
  end

  def test_sum
    a = [1,2,3]
    
    result = sum(a)

    assert_equal 6, result

    result = sum(a) do |value|
      value * 10
    end

    assert_equal 60, result
  end
end
