class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :splash_pad

  # GET /expenses or /expenses.json
  def index
    @expenses = Group.find(params[:group_id]).group_expenses.includes([:expense])
    @total = 0
    @expenses.each do |expense|
      @total += expense.expense.amount
    end
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(user_id: current_user.id, name: expense_params[:name], amount: expense_params[:amount])

    respond_to do |format|
      if @expense.save
        @group_expense = GroupExpense.new(expense_id: @expense.id, group_id: params[:group_id])
        if @group_expense.save
          format.html do
            redirect_to group_expenses_path(params[:group_id]), notice: 'Expense was successfully created.'
          end
          format.json { render :show, status: :created, location: @expense }
        else
          @expense.destroy
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @expense.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  # def update
  #   respond_to do |format|
  #     if @expense.update(expense_params)
  #       format.html { redirect_to expense_url(@expense), notice: "Expense was successfully updated." }
  #       format.json { render :show, status: :ok, location: @expense }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @expense.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /expenses/1 or /expenses/1.json
  # def destroy
  #   @expense.destroy

  #   respond_to do |format|
  #     format.html { redirect_to expenses_url, notice: "Expense was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def splash_pad
    redirect_to splash_screen_path unless user_signed_in?
  end
end
