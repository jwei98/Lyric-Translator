require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  def setup
    @translation = translations(:one)
  end
  
  test "translation belongs to" do
    assert_equal "justin@example.com", @translation.user.email
  end
  
  test 'destroy translation does not destroy user' do
    @translation.destroy
    assert_equal 2, User.all.size
  end
  
  test 'invalid without name' do
    @translation.name = nil
    assert_equal false, @translation.valid?
  end
  test 'invalid without lyric' do
    @translation.lyric = nil
    assert_equal false, @translation.valid?
  end
  test 'invalid without translation' do
    @translation.translation = nil
    assert_equal false, @translation.valid?
  end
  
  test "number of translations" do
    assert_equal 3, Translation.all.size
  end
  
end
