class StepCommentsController < ApplicationController
  before_action :set_step_comment, only: [:show, :edit, :update, :destroy]

  # GET /step_comments
  # GET /step_comments.json
  def index
    @step_comments = StepComment.all
  end

  # GET /step_comments/1
  # GET /step_comments/1.json
  def show
  end

  # GET /step_comments/new
  def new
    @step_comment = StepComment.new
  end

  # GET /step_comments/1/edit
  def edit
  end

  # POST /step_comments
  # POST /step_comments.json
  def create
    @step_comment = StepComment.new(step_comment_params)

    respond_to do |format|
      if @step_comment.save
        format.html { redirect_to @step_comment, notice: 'Step comment was successfully created.' }
        format.json { render :show, status: :created, location: @step_comment }
      else
        format.html { render :new }
        format.json { render json: @step_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /step_comments/1
  # PATCH/PUT /step_comments/1.json
  def update
    respond_to do |format|
      if @step_comment.update(step_comment_params)
        format.html { redirect_to @step_comment, notice: 'Step comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @step_comment }
      else
        format.html { render :edit }
        format.json { render json: @step_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /step_comments/1
  # DELETE /step_comments/1.json
  def destroy
    @step_comment.destroy
    respond_to do |format|
      format.html { redirect_to step_comments_url, notice: 'Step comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step_comment
      @step_comment = StepComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_comment_params
      params.require(:step_comment).permit(:step_id, :text, :user_id)
    end
end
