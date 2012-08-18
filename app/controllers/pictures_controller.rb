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
    if @picture.comments.create(:comment => params[:comment],:user_id => current_user.id)
      respond_to do |format|
      format.json {
          render :json => "success"
      }
      end
    else
      respond_to do |format|
      format.json {
          render :json => "failed"
      }
      end

    end
  end

  def show_comment
    @picture = Picture.find(params[:picture_id])
    @offset = params[:offset] || 0
    @limit = params[:limit] || 20
    @comments = @picture.comments.limit(@limit).offset(@offset).all
    respond_to do |format|
      format.json {
          render :json => @comments.to_json
      }
    end
  end

  def get_picture_info

    @picture = Picture.find params[:picture_id]
    @user = @picture.user
    result = {:src => @picture.image.url(:presentation),
              :comment_count => @picture.comments.count,
              :like_count => @picture.like_count,
              :author_name => @user.profile.user_name,
              :author_avatar => @user.avatars.where(:active => true).first.logo(:actor),
              :is_following => current_user.has_followed?(@user),
              :description => @picture.description,
              :author_id => @user.id,
              :comments => @picture.comments.limit(20).all
    }
    respond_to do |format|
      format.json {
          render :json => result.to_json
      }
    end
  end
end
