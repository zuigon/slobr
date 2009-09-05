require File.dirname(__FILE__) + '/test_helper.rb'

class TestSlobr < Test::Unit::TestCase

  def setup
    @s = Slobr::Slobr.new("aaabbc")
    @s.text = "aabcccXx"
    @s.broji_slova()
  end

  def test_truth
    assert true
  end

  def test_case_name
    # @s.broji_slova
    assert_equal @s.ispis, <<-EOF
Slovo, Frekv.
  C:     3
  X:     2
  A:     2
  B:     1
EOF
  end

def test_case_name
  @s.text = "aa"
  assert_equal @s.text, "aa"
end

end
