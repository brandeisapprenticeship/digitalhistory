class PathCommentsController < ApplicationController
  before_action :set_path_comment, only: [:show, :edit, :update, :destroy]

  # GET /path_comments
  # GET /path_comments.json
  def index
    @path_comments = PathComment.all
  end

  # GET /path_comments/1
  # GET /path_comments/1.json
  def show
  end

  # GET /path_comments/new
  def new
    @path_comment = PathComment.new
  end

  # GET /path_comments/1/edit
  def edit
  end

  # POST /path_comments
  # POST /path_comments.json
  def create
    @path_comment = PathComment.new(path_comment_params)

    respond_to do |format|
      if @path_comment.save
        format.html { redirect_to assignments_path+"/"+@path_comment.assignment_id.to_s+"/"+@path_comment.assignment_author.to_s }
        format.json { render :show, status: :created, location: @path_comment }
      else
        format.html { render :new }
        format.json { render json: @path_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /path_comments/1
  # PATCH/PUT /path_comments/1.json
  def update
    respond_to do |format|
      if @path_comment.update(path_comment_params)
        format.html { redirect_to assignments_path+"/"+@path_comment.assignment_id.to_s+"/"+@path_comment.assignment_author.to_s }
        format.json { render :show, status: :ok, location: @path_comment }
      else
        format.html { render :edit }
        format.json { render json: @path_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /path_comments/1
  # DELETE /path_comments/1.json
  def destroy
    @path_comment.destroy
    respond_to do |format|
      format.html { redirect_to path_comments_url, notice: 'Path comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_path_comment
      @path_comment = PathComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def path_comment_params
      params.require(:path_comment).permit(:text, :user_id, :assignment_author, :assignment_id, :present)
    end
end
