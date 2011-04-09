class TodosController < ApplicationController

  def show
    @todo = Todo.includes(:tasks).find_by_url_hash params[:url_hash].upcase
  end

  def new
    @todo = Todo.new
    4.times do
      @todo.tasks.build
    end
  end

  def create
    @todo = Todo.new(params[:todo])

    if @todo.save
      redirect_to "/" << @todo.url_hash, :notice => "Here's you todo list..."
    else
      render :action => "new"
    end
  end

  def update
    @todo = Todo.find(params[:id])
    
    if request.xhr? and @todo.update_attributes(params[:todo])
      render :head=>:ok
    else
      render :action => "new"
    end
  end

end
