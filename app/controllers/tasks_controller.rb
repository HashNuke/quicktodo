class TasksController < ApplicationController
  before_filter :allow_only_xhr
  
  respond_to :json
  
  def create
    @task = Task.new params[:task]
    @task.save
    respond_with @task
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes(params[:task])
    respond_with @task
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
  end
  
  private
  def allow_only_xhr
    unless request.xhr?
      render :status => 404
    end
  end
  
end
