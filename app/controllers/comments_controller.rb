class CommentsController < SignedInController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_if_not_authorized(@comment.issue)
  end
  
  def index
    @comments = Comment.all
    set_issue
  end

  def new
    @comment = Comment.new
  end

  def create
    set_issue
    @comment = @issue.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to comment_path @comment
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
      redirect_to issue_comment_path(@comment.issue, @comment)
    else
      render :edit
    end
  end

  def destroy
    set_issue
    @comment.destroy
    redirect_to issue_path(@issue)
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
  end
end