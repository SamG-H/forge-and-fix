class CommentsController < SignedInController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_if_not_authorized(@comment)
  end
  
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    set_issue
    @comment = @issue.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to project_issue_path @issue.project, @comment.issue
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_issue_path @comment.issue.project, @comment.issue
    else
      render :edit
    end
  end

  def destroy
    @issue = @comment.issue
    @comment.destroy
    redirect_to project_issue_path(@issue.project, @issue)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def set_issue
    @issue = Issue.find_by(id: params[:id])
    puts "PARAMS[:ID] == #{params[:id]}"
  end
end
