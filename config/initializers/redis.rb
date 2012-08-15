TimelineNotify.redis = "localhost:6379/timeline"
@r = Redis.new
Likeable.setup do |likeable|
  likeable.redis  = Redis::Namespace.new(:likeable, :redis => @r)
end
