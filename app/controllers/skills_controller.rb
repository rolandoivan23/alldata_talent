
class SkillsController < ApplicationController
  before_action :set_skill, only: %i[ show edit update destroy ]
  include SkillsHelper


  # GET /skills or /skills.json
  def index
    @skills = Skill.all
  end

  # GET /skills/1 or /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills or /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to skills_url, notice: "Skill was successfully created." }
        format.json { render :index, status: :created, location: @skill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1 or /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to skills_url, notice: "Skill was successfully updated." }
        format.json { render :index, status: :ok, location: @skill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1 or /skills/1.json
  def destroy
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url, notice: "Skill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def validate_answer
    answer = params[:answer]
    phase = params[:phase].to_i
    right_answer = get_answer_by_phase phase
    response = answer == right_answer ? "right_answer(#{phase});" : "bad_answer(#{phase});"
   
    respond_to do |format|
      format.js { render js: response }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:name, :description)
    end
end
