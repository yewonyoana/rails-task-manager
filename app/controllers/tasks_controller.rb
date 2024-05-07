class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # SHOW ALL
  def index
    @tasks = Task.all
  end

  # SHOW ONE TASK
  def show
  end

  # CREATE - FORM
  def new
    @task = Task.new
  end
  # CREATE - CREATE NEW TASK
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #UPDATE
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  #DELETE
  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private
  # STRONG PARAMS
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
