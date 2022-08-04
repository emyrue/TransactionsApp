require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:example) do
    @user = User.create(name: 'Emily', email: 'emily@emily.com', password: '123456', password_confirmation: '123456')
    @expense = Expense.create(name: 'Transaction', amount: 3, user_id: @user.id)
  end

  it 'Name must be present' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'Amount must be present' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end

  it 'Amount must be greater than 0' do
    @expense.amount = -1
    expect(@expense).to_not be_valid
  end
end
