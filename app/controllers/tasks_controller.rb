class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @project
    @task
  end

  def new
    @project = Project.find(params[:project_id])  # Récupère le projet associé
    @task = @project.tasks.build # Initialise une nouvelle tâche pour le projet
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    @task.user_id = current_user.id
      if @task.save
        redirect_to @project, notice: "Tâche créée avec succès"
      else
        render :new
      end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :time_task, :user_id)
  end

end
