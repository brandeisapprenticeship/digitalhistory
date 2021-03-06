class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  # GET /steps
  # GET /steps.json
  def index
    @steps = Step.all
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
  end

  # GET /steps/new
  def new
    @step = Step.new
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = Step.new(step_params)
    @step.screenshot = step_params[:screenshot]
    respond_to do |format|
      if @step.save
        if !params.has_key?(:bookmarklet)
          format.html { redirect_to assignment_path(@step.assignment.id)+"/"+@step.user_id.to_s+"/"+@step.id.to_s}
        else
          format.html { redirect_to bookmarkletSuccess_url}
        end
      else
        flash[:errors] = @step.errors
        format.html { redirect_to assignment_path(@step.assignment.id)+"/"+@step.user_id.to_s }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to assignment_path(@step.assignment.id)+"/"+@step.user_id.to_s+"/"+@step.id.to_s}
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def bookmarklet
    @step = Step.new
    
    @assignments = Assignment.all
    if params.has_key?(:assignment)
      @assignment=Assignment.find(params[:assignment])
    else
      @assignment=Assignment.last
    end
    if !@assignment.blank?
      @steps = Step.nested_set.where(assignment_id: @assignment.id, user_id: current_user.id)
    end
    render :layout=>false
  end

  def pageICameFrom
    
    if params.has_key?(:assignment)
      @assignment=Assignment.find(params[:assignment])
    else
      @assignment=Assignment.last
    end
    @steps = Step.nested_set.where(assignment_id: @assignment.id, user_id: current_user.id)
    render :layout=>false
  end

  def bookmarkletSuccess
    render :layout=>false
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:user_id, :assignment_id, :title, :url, :justification, :parent_id, :lft, :rgt, :favorite, :document, :screenshot)
    end
end
