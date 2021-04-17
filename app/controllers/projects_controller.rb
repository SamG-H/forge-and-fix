class ProjectsController < SignedInController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_if_not_authorized(@project)
  end
  
  def index
    if params[:q] && !params[:q].empty?
      @projects = Project.list_category(params[:q]).order_by_issue_count
    else
      @projects = Project.order_by_issue_count
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :category, :description)
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end
end
