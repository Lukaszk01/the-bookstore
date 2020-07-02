class BooksController < ApplicationController
  def show
    @books = Book.new
    @books = Book.all
  end
  def index
    @books = Book.all

  end

  def new
    @author = Author.find(params[:author_id])
    @bookss = Book.new
  end

  def create
    @author = Author.find(params[:author_id])
    @books = Book.new(book_params)
    @books.author = @author
    if @books.save
      redirect_to author_path(@author)
    else
      render "show"
    end
  end

  #   @author = Author.new
  #   @author = Author.find(params[:id])
  #   @bookss = Book.new(book_params)
  #   @bookss.author_id = params[:author_id]
  #   if @books.save
  #     redirect_to author_path(@author)
  #   else
  #     render "new"
  #   end
  # end

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
