require "test_helper"

class User2Test < ActiveSupport::TestCase
  def setup
    @user = User2.new(name:"Harold", email:"harold.goodboy@dogo.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be blank" do
    @user.name = " " * 5
    assert_not @user.valid?
  end

  test "email should not be blank" do
    @user.email = " " * 5
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "valid addresses should be accepted" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

  test "invalid addresses should not be acceped" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end
end
