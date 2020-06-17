class PagesController < ApplicationController
  require 'json'
  require 'uri'
  require 'open-uri'

  def home
    @book = Book.new(params[:id])

  end
  def search

  end

  private

  def search_book
        # skip_before_action :authenticate_user!, only: :home
    book_title = "python"
    url = "https://www.googleapis.com/books/v1/volumes?q=#{:search}&maxResults=15&key=#{ENV['']}"
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
end
