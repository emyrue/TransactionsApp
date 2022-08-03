require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(name: 'Emily', email: 'emily@emily.com', password: '123456', password: '123456')
  end

  it "Name must be present" do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end
