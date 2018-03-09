class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)    
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :completed)
    end
end
