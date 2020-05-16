class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def show
    # @author = Author.find(params[:id])

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
  private

  def author_params

  end

end
