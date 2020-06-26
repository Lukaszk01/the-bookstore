class AuthorsController < ApplicationController
  def new
    @authors = Author.new
    @books = Book.new
  end

  def index
    @authors = Author.all
    @books = Book.all
  end

  def show
    @books = Book.new
     @authors = Author.find(params[:id])


  end

  def create
    @authors = Author.new(author_params)
    if @authors.save!
      redirect_to @authors, notice: 'Author was successfully created.'
    else
      render :index
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
