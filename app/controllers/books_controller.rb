class BooksController < ApplicationController

  # def index
  #   # response = Book.__elasticsearch__.search(
  #   #   query: {
  #   #     multi_match: {
  #   #       query: params[:query],
  #   #       fields: ['name', 'author.first_name', 'author.last_name', 'isbn']
  #   #     }
  #   #   }
  #   # ).results

  #   # render json: {
  #   #   results: response.results,
  #   #   total: response.total
  #   # }
  # end

  def index
    @books = Book.all
    @search = params["search"]
    if @search.present?
      @title = @search["title"]
      @books = Book.where(title: @title)
    end
  end

  def search
   url = "https://www.googleapis.com/books/v1/volumes?q=#{params[:search]}&maxResults=15&key=#{ENV["GOOGLE_API"]}"
   user_serialized = open(url).read
   user = JSON.parse(user_serialized)

     title = "#{user['items'][0]['volumeInfo']['title']}"
     kind = "Kind: #{user['kind']}"
     author "Author: #{user['items'][0]['volumeInfo']['authors'].join}"
     description = "Description: #{user['items'][0]['volumeInfo']['description']}"

     publisher = "Publisher: #{user['items'][0]['volumeInfo']['publisher']}"
     date = "Date: #{user['items'][0]['volumeInfo']['publishedDate']}"
     type = "Type: #{user['items'][0]['volumeInfo']['categories']}"
     rating = "Avarage rating: #{user['items'][0]['volumeInfo']['averageRating']}"
     image = "Image: #{user['items'][0]['volumeInfo']['imageLinks']['thumbnail']}"
     language = "Language: #{user['items'][0]['volumeInfo']['language']}"
     preview = "Preview: #{user['items'][0]['volumeInfo']['previewLink']}"

     Book.new(
      title: title,
      kind: kind,
      author: author,
      description: description,
      publisher: publisher,
      date: date,
      type: type,
      rating: rating,
      image: image,
      language: language,
      preview: preview
      )

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

