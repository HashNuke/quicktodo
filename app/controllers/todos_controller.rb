class TodosController < ApplicationController

  def show
    @todo = Todo.find_by_url_hash(params[:url_hash])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo }
    end
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

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to(@todo, :notice => 'Todo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

end
