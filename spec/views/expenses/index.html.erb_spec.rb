require 'rails_helper'

RSpec.describe 'expenses/index', type: :feature do
  before(:example) do
    @user = User.create(name: 'Emily', email: 'emily@emily.com', password: '123456', password_confirmation: '123456')
    sign_in @user
    @group = Group.create(name: 'Transportation', icon: '@', user_id: @user.id)
    @expense = Expense.create(name: 'My Transaction', amount: 3, user_id: @user.id)
    @group_expense = GroupExpense.create(group_id: @group.id, expense_id: @expense.id)
    visit group_expenses_path(@group)
  end

  it 'renders the correct text' do
    expect(page).to have_content('My Transaction')
  end

  it 'should have a button to add a new expense' do
    expect(page).to have_content('New Transaction')
  end

  it 'new transaction button should lead to form page' do
    click_on 'New Transaction'
    expect(current_path).to eq(new_group_expense_path(@group))
  end
end
