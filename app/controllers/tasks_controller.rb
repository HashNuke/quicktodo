class TasksController < ApplicationController
  
  def create
    @task = Task.new params[:task]
    @task.save
    render :json=> @task
  end
  
  def show
    @task = Task.find params[:id]
    render :json => @task
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
  
end
