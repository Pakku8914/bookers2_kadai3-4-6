class FavoritesController < ApplicationController
  def create
    # いいねされていなかったら実行
    if !Favorite.find_by(book_id: params[:book_id], user_id: current_user.id).present?
      @book = Book.find(params[:book_id])
      @favorite = current_user.favorites.new(book_id: @book.id)
      @favorite.save
      render '_replace_btn'
    end
  end

  def destroy
    if Favorite.find_by(book_id: params[:book_id], user_id: current_user.id).present?
      @book = Book.find(params[:book_id])
      @favorite = current_user.favorites.find_by(book_id: @book.id)
      @favorite.destroy
      render '_replace_btn'
    end
  end
end
