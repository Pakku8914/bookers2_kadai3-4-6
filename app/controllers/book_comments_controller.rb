class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = book.id
    @comment.save
    render '_create'
  end

  def destroy
    @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @comment.destroy
    render '_destroy'
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:body)
  end
end
