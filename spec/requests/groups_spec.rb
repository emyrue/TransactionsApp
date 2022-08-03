require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /index" do
    before(:example) do
      @user = User.create(name: 'Emily', email: 'emily@emily.com', password: '123456', password_confirmation: '123456')
      sign_in @user
      @group = Group.create(name: 'Category', icon: '@', user_id: @user.id)
      @expense = Expense.create(name: 'Transaction', amount: 3, user_id: @user.id)
      get groups_path
    end

    it "returns an ok status code" do
      expect(response).to have_http_status(:ok)
    end

    it "renders template" do
      expect(response).to render_template("index")
    end

    it "renders correct text" do
      expect(response.body).to include('Category')
    end
  end
end
