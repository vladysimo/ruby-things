require_relative 'test_deps'

class EssentialsTest < MiniTest::Unit::TestCase
  def test_string_interpolation
    a = 10
    assert_equal "10 pence", "#{a} pence"
  end

  def test_array_creation
    a = [1, 2, 3]
    assert_equal [1,2,3], a
  end

  def test_more_array_creation
    a = %w(foo bar baz)
    assert_equal ["foo","bar", "baz"], a
  end

  def test_string_conversions
    a = "3 little pigs"
    assert_equal 3, a.to_i
  end

  def test_hashes
    a =  { :foo => 1, :bar => 2, "baz" => 3, [] => 4 }
    assert_equal [:foo, :bar, "baz", []], a.keys
    assert_equal [1,2,3,4], a.values
  end

  def test_hash_creation
    a = Hash[:foo, 1, :bar, 2]
    assert_equal({ :foo => 1, :bar => 2 }, a)
  end

  def test_more_hash_creation
    a = Hash.new(:foo)
    5000.times do |i|
      assert_equal :foo, a[i]
    end
  end

  def test_and_even_more_hash_creation
    a = Hash.new { |hash, key| hash[key] = :foo}
    5000.times do |i|
      assert_equal :foo, a[i]
    end

    a[:moloz] = :bar
    assert_equal :bar, a[:moloz]
  end

  def test_ranges
    a = (1..10)

    assert a.include?(10)
  end

  def test_range_arrays
    a = (1..5).to_a
    assert_equal [1,2,3,4,5], a
  end
end
