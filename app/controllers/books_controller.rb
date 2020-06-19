class BooksController < ApplicationController
  def show
    @books = Book.all
  end

  def new
    # @author = Author.find(params[:id])
    @book = Book.new
  end

  def create
    # @author = Author.find(params[:author_id])
    @book = Book.new(book_params)
    @book.author = @author
      if @book.author.save
        redirect_to author_path(@author)
      else
        render "author/show"
      end
  end

  def destroy

  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :cover, :author)
  end
end
