class AuthorsController < ApplicationController
  def new
    @author = Author.new
    @book = Book.new
  end

  def index
    @authors = Author.all
    @books = Book.all
  end

  def show
     @author = Author.find(params[:id])
     @books = Book.new

  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new
    end

  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

  end
  private

  def author_params
    params.require(:author).permit(:name)
  end

end
