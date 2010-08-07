require File.dirname(__FILE__) + '/test_helper.rb'

class TestSlobr < Test::Unit::TestCase

  def setup
    @s = Slobr::Slobr.new("aaabbc")
    @s.text = "aabcccXx"
    @s.broji_slova()
  end

  def test_prvi
    assert_equal @s.ispis+"\n", <<-EOF
Slovo, Frekv.
  C:   3
  X:   2
  A:   2
  B:   1
EOF
  end

end
