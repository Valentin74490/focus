class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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

  def task_params
    params.require(:task).permit(:name, :description, :status, :time_task, :user_id)
  end

end
