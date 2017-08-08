class TasksController < ApplicationController
  def index         # GET /restaurants
    @task = Task.all
  end

  def show          # GET /restaurants/:id
    @task = Task.find(params[:id])
  end

  def new           # GET /restaurants/new
    @task = Task.new
  end

  def create        # POST /restaurants
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit          # GET /restaurants/:id/edit
    @task = Task.find(params[:id])
  end

  def update        # PATCH /restaurants/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy       # DELETE /restaurants/:id
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
