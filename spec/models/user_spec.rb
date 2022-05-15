require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without the name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without the email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without the password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without the password confirmation' do
    @user.password_confirmation = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid with a duplicate email address' do
    user = FactoryBot.build(:user)
    user.email = @user.email
    expect(user).to_not be_valid
  end
end
