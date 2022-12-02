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

  private
    # Only allow a list of trusted parameters through.
    def user_skill_params
      params.require(:user_skill).permit(:user_id, :skill_id, :rank)
    end
end
