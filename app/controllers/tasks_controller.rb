class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

def create
  @list = List.find(params[:list_id])
  @task = @list.tasks.new(task_params)
  if @task.save
    redirect_to list_path(@task.list)
  else
    render :new
  end
end

def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to list_path(@task.list)
end

def edit
  @task = Task.find(params[:id])
  @list = @task.list
  render :edit
end

def update
  @task = Task.find(params[:id])
  @list = List.find(params[:list_id])
  if @task.update(task_params)
    redirect_to list_path(@task.list)
  else
    render :edit
  end
end


private
  def task_params
    params.require(:task).permit(:description, :done, :complete)
  end
end
