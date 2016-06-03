class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)

		if @task.save
			redirect_to tasks_path, :flash => {:notice => "#{@task.title} was created!"}
		else
			render :new
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to tasks_path
	end

	protected

	def task_params
		params.require(:task).permit(:title, :description)
	end

end
