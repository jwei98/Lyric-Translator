require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "justin@example.com", admin: true)
    @testuser = users(:justin)
  end
  
  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end
  
  test 'destroy user destroys translations' do
    @testuser.destroy()
    assert_equal 1, Translation.all.size
  end
  
  test 'default admin should be false' do
    @nonadmin = User.new(email: "justin@example.com")
    assert_equal false, @nonadmin.admin
  end
  
  test 'number reviews of single user' do
    assert_equal 2, @testuser.translations.size
  end
  
  test 'should be admin' do
    assert_equal true, @user.admin
  end
  
  test "number of users" do
    assert_equal 2, User.all.size
  end
  
end
