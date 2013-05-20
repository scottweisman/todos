class TodosController < ApplicationController
	def index
		@todos = current_user.todos
		# @todos = Todo.where(owner_email: current_email)
	end

	def new
		@todo = Todo.new
	end

	def create
		current_user.todos.create params[:todo]
		# Todo.new (params[:todo]) do |todo|
		# 	todo.owner_email = current_email
		# end.save

		redirect_to todos_path
	end
end