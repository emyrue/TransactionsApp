require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:example) do
    @user = User.create(name: 'Emily', email: 'emily@emily.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Category', icon: '@', user_id: @user.id)
  end

  it "Name must be present" do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it "Icon must be present" do
    @group.name = nil
    expect(@group).to_not be_valid
  end
end
