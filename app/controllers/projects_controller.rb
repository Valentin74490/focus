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
  end

end
