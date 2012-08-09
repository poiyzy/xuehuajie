class PicturesController < ApplicationController

  def index
    @pictures = current_user.pictures
    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
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
end
