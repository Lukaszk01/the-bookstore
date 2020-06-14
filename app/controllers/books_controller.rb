class BooksController < ApplicationController

  def index
    response = Book.__elasticsearch__.search(
      query: {
        multi_match: {
          query: params[:query],
          fields: ['name', 'author.first_name', 'author.last_name', 'isbn']
        }
      }
    ).results

    render json: {
      results: response.results,
      total: response.total
    }
  end
end


  # def show
  #   @books = Book.all
  # end

  # def new
  #   @author = Author.find(params[:author_id])
  #   @book = Book.new
  # end

  # def create
  #   @author = Author.find(params[:author_id])
  #   @book = Book.new(book_params)
  #   @book.author = @author
  #     if @book.author.save
  #       redirect_to author_path(@author)
  #     else
  #       render "author/show"
  #     end
  # end

  # def destroy

  # end

  # private

  # def book_params
  #   params.require(:book).permit(:title, :genre, :cover)
  # end

