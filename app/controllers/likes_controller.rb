class LikesController < ApplicationController
  before_action :set_like, only: :destroy

  def create
    @user_id = current_user.id
    @dog_id = params[:dog_id]

    like = { user_id: @user_id, dog_id: @dog_id }

    @like = Like.new(like)

    if @like.save
      redirect_to dog_path(@dog_id)
    else
      redirect_to dogs_path
    end
  end

  def destroy
    @dog_id = params[:dog_id]
    @like.destroy

    redirect_to dog_path(@dog_id)
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end
end
