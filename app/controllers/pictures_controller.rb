class PicturesController < ApplicationController

  def index
    @pictures = current_user.pictures
    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
  end
  def show
    @picture = Picture.find(params[:id])
    @user = @picture.user
    @title = @picture.name
    @like_count = @picture.like_count
    @comments = @picture.comments.all
  end
  def create
    p_attr = params[:picture]
    p_attr[:file] = params[:picture][:file].first if params[:picture][:file].class == Array

    @picture = current_user.pictures.new(p_attr)
    if @picture.save
      respond_to do |format|
        format.html {  
          render :json => [@picture.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@picture.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @picture = current_user.pictures.find(params[:id])
    if @picture.nil?
      render :json => false
    else
      @picture.destroy
      render :json => true
    end
  end
  def create_comment
    @picture = Picture.find(params[:picture_id])
    comment_title = params[:title]
    if @picture.comments.create(:comment => params[:comment],:user_id => current_user.id)
      return :json => true
    else
      return :json => false
    end
  end
  def show_comment
    comment_offset = params[:offset] || 0
    comment_limit = params[:limit] || 15
    @picture = Picture.find(params[:picture_id])
    if @picture.nil?
      render :json => "picture no find"
    else
      @comments = @picture.comments.offset(comment_offset).limit(comment_limit).all
      render :json => @comments.to_json
    end
    
  end
end
