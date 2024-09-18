class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @tasks = Task.all
    @projects = Project.all
    @project = Project.find_by(id: params[:project_id])
  end
end
