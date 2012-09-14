# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before do
    @user = User.new( name: "Very Geese", email: "very.geese@gamil.com")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }

  it { should be_valid }

  describe "When name is not present" do
    before { @user.name = "" }
    it {should_not be_valid }
  end

  describe "When email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "When name is too long" do
    before { @user.name = 'a' * 101 }
    it { should_not be_valid }
  end

  describe "When email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "When email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end 
end
