class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:present, :show, :edit, :update, :destroy]
  include TheSortableTreeController::Rebuild


  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    if !PathComment.where(assignment_id: @assignment.id, present:false, user_id: current_user.id, assignment_author: params[:assignment_author]).blank?
      @path_comment = PathComment.where(assignment_id: @assignment.id, present:false, user_id: current_user.id, assignment_author: params[:assignment_author])[0]
    else
      @path_comment = PathComment.new
    end

    if !PathComment.where(assignment_id: @assignment.id, present:true, user_id: current_user.id, assignment_author: params[:assignment_author]).blank?
      @presentation_comment = PathComment.where(assignment_id: @assignment.id, present:true, user_id: current_user.id, assignment_author: params[:assignment_author])[0]
    else
      @presentation_comment = PathComment.new
    end

    if !Presentation.where(assignment_id: @assignment.id, assignment_author: params[:assignment_author]).blank?
      @presentation = Presentation.where(assignment_id: @assignment.id, assignment_author: params[:assignment_author])[0]
    else
      @presentation = Presentation.new
    end

    if !Step.where(id: params[:step_id]).blank?
      @step = Step.find(params[:step_id])
    else
      @step = Step.new
    end 

    @steps = Step.nested_set.where(assignment_id: @assignment.id, user_id: params[:assignment_author])
  end

  def present
    if !PathComment.where(assignment_id: @assignment.id, user_id: current_user.id, assignment_author: params[:assignment_author]).blank?
      @path_comment = PathComment.where(assignment_id: @assignment.id, user_id: current_user.id, assignment_author: params[:assignment_author])[0]
    else
      @path_comment = PathComment.new
    end

    if !Presentation.where(assignment_id: @assignment.id, assignment_author: params[:assignment_author]).blank?
      @presentation = Presentation.where(assignment_id: @assignment.id, assignment_author: params[:assignment_author])[0]
    else
      @presentation = Presentation.new
    end

    if !Step.where(id: params[:step_id]).blank?
      @step = Step.find(params[:step_id])
    else
      @step = Step.new
    end 

    @steps = Step.nested_set.where(assignment_id: @assignment.id, user_id: params[:assignment_author])
  end

  def summary
    if current_user.admin?
      @assignment = Assignment.find(params[:id])
      @students = User.where(admin: false)
    else
      @assignments = Assignment.all
      @student = current_user
    end
    end


  def presentation_summary
    @assignments=Assignment.all
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
   
    @assignment = Assignment.new(assignment_params)
   

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_path, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to assignments_path, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:due_date, :description, :title)
    end
end
