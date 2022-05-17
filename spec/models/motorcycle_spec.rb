require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it "is valid with valid attributes" do
    motorcycle = FactoryBot.build(:motorcycle, user: @user)
    expect(motorcycle).to be_valid
  end

  it "is not valid without a title" do
    motorcycle = FactoryBot.build(:motorcycle, user: @user, title: nil)
    expect(motorcycle).to_not be_valid
  end

  it "is not valid without a description" do
    motorcycle = FactoryBot.build(:motorcycle, user: @user, description: nil)
    expect(motorcycle).to_not be_valid
  end

  it "is not valid without a year" do
    motorcycle = FactoryBot.build(:motorcycle, user: @user, year: nil)
    expect(motorcycle).to_not be_valid
  end

  it "is not valid without a model" do
    motorcycle = FactoryBot.build(:motorcycle, user: @user, model: nil)
    expect(motorcycle).to_not be_valid
  end

  it "is not valid without a color" do
    motorcycle = FactoryBot.build(:motorcycle, user: @user, color: nil)
    expect(motorcycle).to_not be_valid
  end

  it "is not valid without a user" do
    motorcycle = FactoryBot.build(:motorcycle, user: nil)
    expect(motorcycle).to_not be_valid
  end

  it "is not valid without a unique title" do
    motorcycle = FactoryBot.create(:motorcycle, user: @user)
    motorcycle2 = FactoryBot.build(:motorcycle, user: @user, title: motorcycle.title)
    expect(motorcycle2).to be_valid
  end
end
