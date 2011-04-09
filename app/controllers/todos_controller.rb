class TodosController < ApplicationController

  def show
    @todo = Todo.find_by_url_hash(params[:url_hash])
  end

  def new
    @todo = Todo.new
  end


  def create
    @todo = Todo.new(params[:todo])

    if @todo.save
      redirect_to(@todo, :notice => 'Todo was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(params[:todo])
      redirect_to(@todo, :notice => 'Todo was successfully updated.')
    else
      render :action => "edit"
    end
  end

end
