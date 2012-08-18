class LikeController < ApplicationController
  def create
      target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])
      current_user.like!(target)
      respond_to do |format|
        format.html {redirect_to :back, :notice => 'success' }
        format.json { render :json =>    'success'}
      end
    end

    def destroy
      target = Likeable.find_by_resource_id(params[:resource_name], params[:resource_id])
      current_user.unlike!(target)
      respond_to do |format|
        format.html { redirect_to :back, :notice => 'success' }
        format.json { render :json =>  'success'}
      end
    end
end
