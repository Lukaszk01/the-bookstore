class BooksController < ApplicationController
  def show
    @books = Book.all
    @authors.new
  end

  def new
    @books = Book.new
  end

  def create
    # @author = Author.find(params[:author_id])
    # @book = Book.new(book_params)
    # @book.author = @author
    #   if @book.save
    #     redirect_to author_path(@author)
    #   else
    #     render "new"
    #   end

    # @author = Author.new
    # @author = Author.find(params[:id])
    @books = Book.new(book_params)
    @books.author_id = params[:author_id]
    if @books.save
      redirect_to author_path(@author)
    else
      render "new"
    end
  end

  def destroy
    @book = Book.find(book_params)
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :cover, :author, :photo)
  end
end
