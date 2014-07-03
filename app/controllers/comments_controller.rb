class CommentsController < ApplicationController

  before_action :signed_in_user, only: [:new, :create]
  before_action :correct_user,   only: :destroy

  def new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment success created!"
      redirect_to @hotel
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to @comment.hotel
  end

private 

    def comment_params
      params.require(:comment).permit(:body, :user_id, :rating)
    end

end

