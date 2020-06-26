class BooksController < ApplicationController
  def show
    @books = Book.all
    @authors.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @author = Author.find(params[:id])
    @book.author = @author
    if @book.save
      redirect_to author_path(@author)
    else
      render "new"
    end
  end

  #   @author = Author.new
  #   @author = Author.find(params[:id])
  #   @books = Book.new(book_params)
  #   @books.author_id = params[:author_id]
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
    params.require(:book).permit(:title, :genre, :cover, :author)
  end
end
