class IssuesController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.new(issue_params)
    if @issue.save
      redirect_to @issue
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :category)
  end

  def set_issue
    @issue = Issue.find_by(id: params[:id])
  end

end
