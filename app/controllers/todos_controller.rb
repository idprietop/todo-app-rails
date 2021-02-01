class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
    respond_to :js
  end

  def create
    user = User.first
    @todo = Todo.new(todo_params)
    @todo.user_id = user.id

    @todo.save
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :text)
  end
end
