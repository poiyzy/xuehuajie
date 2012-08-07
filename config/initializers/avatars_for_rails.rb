AvatarsForRails.setup do |config|
  config.avatarable_model = :user
  config.current_avatarable_object = :current_user
  config.avatarable_filters = [:authenticate_user!]
  config.avatarable_styles = { :representation => "20x20>",
                                   :actor => '75x75>',
                                   :user => '200x200'}

end
