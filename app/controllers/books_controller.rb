class BooksController < ApplicationController
  def show
    # @authors = Author.new
    @authors = Author.all
    @books = Book.new
    @books = Book.all
  end
  def index
    @books = Book.all

  end

  def new
    @author = Author.find(params[:author_id])
    @book = Book.new
  end

  def create
    @author = Author.find(params[:author_id])
    @book = Book.new(book_params)
    @book.author = @author
    if @book.save
      redirect_to author_path(@author)
    else
      render "authors/show"
    end
  end

  def destroy
    @book = Book.find(book_params)
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :photo)

  end
end
