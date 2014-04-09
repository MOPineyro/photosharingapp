require 'spec_helper'
describe User do
  before :each do
    @user = FactoryGirl.build :user
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  it 'should have an email' do
    @user.nil?.should eq false

  end
end
