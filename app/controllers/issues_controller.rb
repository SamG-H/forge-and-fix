class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_signin?, only: [:new, :create, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_if_not_authorized(@issue.project)
  end
  
  def index
    @issues = Issue.all
    set_project
  end

  def new
    @issue = Issue.new
  end

  def create
    binding.pry
    set_project
    @issue = @project.issues.new(issue_params)
    if @issue.save
      redirect_to project_issues_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      redirect_to project_issue_path(@issue.project, @issue)
    else
      render :edit
    end
  end

  def destroy
    set_project
    @issue.destroy
    redirect_to project_path(@project)
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end

  def set_issue
    @issue = Issue.find_by(id: params[:id])
  end

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end
end
