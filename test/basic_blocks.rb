require_relative 'test_deps'

#yeild = autoapelare block
# TODO: with blocks_given

def love
	if block_given?
		"I love #{yield} super hard"
	else
		"Nothing"
	end
end

def printing_result
	puts yield
end

class BasicBlocksTest < MiniTest::Unit::TestCase

  def test_wrapping_a_string_in_things
    result = love do
    	"ponies"
    end

    assert_equal "I love ponies super hard", result
  end

  def test_ensuring_things_get_done
    assert_print("2") do
      printing_result do
        1 + 1
      end
    end
  end

  def test_different_behavior_with_or_without_blocks
    assert_equal "Nothing", love

    assert_equal "I love ponies super hard", love { "ponies" }
  end
end
