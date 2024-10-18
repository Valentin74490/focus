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
      @focused_task = @task
      respond_to do |format|
        format.html { redirect_to project_path(@project, focused_task:@task.id, dontanimate:true), notice: "Tâche mise à jour avec succès." }
        format.js   # Pour gérer la réponse via AJAX
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js   # Pour afficher les erreurs via AJAX
      end
    end
  end

  # def start_work
  #   @task = Task.find(params[:id])
  #   if @task.current_session_start.nil?
  #     @task.update(current_session_start: Time.current)
  #   end
  #   redirect_to project_path(@task.project, focused_task: @task.id)
  # end

  # def stop_work
  #   @task = Task.find(params[:id])
  #   @task.stop_session
  #   redirect_to project_path(@task.project, focused_task: @task.id)
  # end



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
