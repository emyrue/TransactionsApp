require 'rails_helper'

RSpec.describe 'Group Index Page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Emily', email: 'emily@emily.com', password: '123456', password_confirmation: '123456')
    sign_in @user
    @group = Group.create(name: 'Transportation', icon: '@', user_id: @user.id)
    @expense = Expense.create(name: 'Transaction', amount: 3, user_id: @user.id)
    @group_expense = GroupExpense.create(group_id: @group.id, expense_id: @expense.id)
    visit groups_path
  end

  it "renders the correct text" do
    expect(page).to have_content("Transportation")
  end

  it "a click on a group should lead to the correct page" do
    click_link 'Transportation'
    expect(current_path).to eq(group_expenses_path(@group))
  end

  it 'should have a button to add a new group' do
    expect(page).to have_content('New Category')
  end

  it 'new category button should lead to form page' do
    click_on 'New Category'
    expect(current_path).to eq(new_group_path)
  end
end