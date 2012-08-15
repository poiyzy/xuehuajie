module PicturesHelper
  # receive paramater Size "thumb" or "presentation" or "cover"
  def picture_link(picture,size="thumb")
    link_to( image_tag(picture.image.url(size)), picture_path(picture))
  end
end
