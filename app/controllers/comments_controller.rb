class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def show
  end

  def destroy
  end

  def create
  end

  def create_comment
    @picture = Picture.find(params[:picture_id])
    if @picture.comments.create(:comment => params[:comment],:user_id => current_user.id)
      render :json => "success"
    else
      render :json => "failed"
    end
  end

  def show_comment
    @picture = Picture.find(params[:picture_id])
    @offset = params[:offset] || 0
    @limit = params[:limit] || 20
    @comments = @picture.comments.limit(@limit).offset(@offset).all
    render :json => @comments.to_json 
  end
end
