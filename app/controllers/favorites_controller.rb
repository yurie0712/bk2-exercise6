class FavoritesController < ApplicationController
  before_action :book

  def create
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
  end

  private

  def book
    @book = Book.find(params[:book_id])
  end

end