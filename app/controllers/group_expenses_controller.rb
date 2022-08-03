class GroupExpensesController < ApplicationController
  before_action :set_group_expense, only: %i[ show edit update destroy ]
  before_action :splash_pad

  # GET /group_expenses or /group_expenses.json
  def index
    @group_expenses = GroupExpense.all
  end

  # GET /group_expenses/1 or /group_expenses/1.json
  def show
  end

  # GET /group_expenses/new
  def new
    @group_expense = GroupExpense.new
  end

  # POST /group_expenses or /group_expenses.json
  def create
    @group_expense = GroupExpense.new(expense_id: params[:expense_id], group_id: params[:group_id])

    respond_to do |format|
      if @group_expense.save
        format.html { redirect_to group_expense_url(@group_expense), notice: "Group expense was successfully created." }
        format.json { render :show, status: :created, location: @group_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_expense
      @group_expense = GroupExpense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_expense_params
      
    end

    def splash_pad
      unless user_signed_in?
        redirect_to splash_screen_path
      end
    end
end
