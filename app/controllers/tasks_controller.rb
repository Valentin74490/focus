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

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to project_path(@project), notice: "La tâche a été mise à jour avec succès."
    else
      render :edit
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
