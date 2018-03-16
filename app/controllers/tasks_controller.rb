class TasksController < ApplicationController

  def index
    @tasksCompleted = Task.where(completed: true)
    @tasksIncompleted = Task.where(completed: false)
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

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(task_params)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def destroy
    @task = Task.destroy(params[:id])
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
