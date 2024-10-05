class ProjectsController < ApplicationController

  def index
  end

  def show
    @project = Project.find(params[:id])
    @status = params[:status]
    if @status
    @tasks = @project.tasks.where(status: @status )
    else
      @tasks = @project.tasks
    end

    if params[:focused_task]
      @focused_task = @project.tasks.find_by(id: params[:focused_task])
    end
  end

end
