class UserSkillsController < ApplicationController

  # GET /user_skills or /user_skills.json
  def index
    @user_skills = UserSkill.includes(:skill).where(:user_id => current_user.id).order(:name)
    @user_skill = UserSkill.new
  end

  # POST /user_skills or /user_skills.json
  def create
    @user_skill = UserSkill.new(user_skill_params)

    respond_to do |format|
      if @user_skill.save
        format.html { redirect_to user_skills_url, notice: "Skill was successfully added." }
        format.json { render :index, status: :created, location: @user_skill }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @user_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_rank
    row = UserSkill.find_by_user_id_and_skill_id(params[:user_id], params[:skill_id])
    row.rank = 0 if !row.rank 
    row.rank += 1;
    row.save

    respond_to do |format|
      format.js
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_skill_params
      params.require(:user_skill).permit(:user_id, :skill_id, :rank)
    end
end
