class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    set_issue
    @task = Task.new(task_params)
    @task.user = current_user
    binding.pry
    if @task.save
      redirect_to task_path @task
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:status, :issue_id)
  end

  def set_issue
    @issue = Issue.find_by(id: params[:issue_id])
  end
                           
  def set_task
    @task = Task.find_by(id: params[:id])
  end

end
