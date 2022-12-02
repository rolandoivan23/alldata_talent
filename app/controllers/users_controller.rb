class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @skills = Skill.all
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User was successfully created." }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User was successfully updated." }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def find

  end

  def find_results
    skill = Skill.where("upper(name) LIKE ?", "%#{params[:query].upcase}%")
    users = User.where("upper(full_name) LIKE ? ", "%#{params[:query].upcase}%" )
    if skill
      users_skills = UserSkill.where(skill: skill)
      users_by_skill = users_skills.map { |row| row.user }
    else
      users_by_skill = []
    end

    puts users_by_skill
    puts users

    @users = users_by_skill + users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @skills = Skill.all
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:full_name, :department, :summary, :ignition_id, :rank)
    end
end
