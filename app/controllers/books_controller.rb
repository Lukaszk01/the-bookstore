class BooksController < ApplicationController
  def show
    @books = Book.all
    @authors.new
  end

  def new
    @book = Book.new
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
    @book = Book.new(book_params)
    @book.author_id = params[:author_id]
    if @book.save
      redirect_to author_path(@author)
    else
      render "new"
    end
  end

  def destroy

  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :cover, :author)
  end
end
