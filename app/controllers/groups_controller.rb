class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :splash_pad

  # GET /groups or /groups.json
  def index
    @groups = Group.where(user_id: current_user.id)
  end

  # GET /groups/new
  def new
    @group = Group.new
    @icons = ['✈️', '🍔', '🛍️', '🥕', '💰', '💅', '🍹', '🎁', '🏥', '🏠', '🚋', '🚰']
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(icon: group_params['icon'], name: group_params['name'], user_id: current_user.id)
    @icons = ['✈️', '🍔', '🛍️', '🥕', '💰', '💅', '🍹', '🎁', '🏥', '🏠', '🚋', '🚰']
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :icon)
    end

    def splash_pad
      unless user_signed_in?
        redirect_to splash_screen_path
      end
    end
end
