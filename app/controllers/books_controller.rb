
class BooksController < ApplicationController

  def index

    # response = Book.__elasticsearch__.search(
    #   query: {
    #     multi_match: {
    #       query: params[:query],
    #       fields: ['name', 'author.first_name', 'author.last_name', 'isbn']
    #     }
    #   }
    # ).results

    # render json: {
    #   results: response.results,
    #   total: response.total
    # }
  end

  # def index
  #   @books = Book.all
  #   @search = params["search"]
  #   if @search.present?
  #     @title = @search["title"]
  # end
  # # @books = Book.search(params[:search])
  # end


 def new
     @book = Book.new()
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
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

   private
    def book_base
      book_title = "python"
      url = "https://www.googleapis.com/books/v1/volumes?q=#{:search}&maxResults=15&key=#{ENV['AIzaSyCceqexSWqOP94O7r06WYfpkd1e3xkEoRo']}"
      user_serialized = open(url).read
      user = JSON.parse(user_serialized)


       @title = "#{user['items'][0]['volumeInfo']['title']}"
       @kind = "Kind: #{user['kind']}"
       @author = "Author: #{user['items'][0]['volumeInfo']['authors'].join}"
       @description = "Description: #{user['items'][0]['volumeInfo']['description']}"
       @publisher = "Publisher: #{user['items'][0]['volumeInfo']['publisher']}"
       @date = "Date: #{user['items'][0]['volumeInfo']['publishedDate']}"
       @type = "Type: #{user['items'][0]['volumeInfo']['categories']}"
       @rating = "Avarage rating: #{user['items'][0]['volumeInfo']['averageRating']}"
       @image = "Image: #{user['items'][0]['volumeInfo']['imageLinks']['thumbnail']}"
       @language = "Language: #{user['items'][0]['volumeInfo']['language']}"
       @preview = "Preview: #{user['items'][0]['volumeInfo']['previewLink']}"
    end
    require 'open-uri'

   def book_params
     params.require(:book).permit(:title, :genre, :cover, :search)
   end
end
