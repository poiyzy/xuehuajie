class TimelineNotify
    class << self 
    def redis=(server)
      case server
      when String
        if server =~ /redis\:\/\//
          redis = Redis.connect(:url => server, :thread_safe => true)
        else
          server, namespace = server.split('/', 2)
          host, port, db = server.split(':')
          redis = Redis.new(:host => host, :port => port,
            :thread_safe => true, :db => db)
        end
        namespace ||= :timeline

        @redis = Redis::Namespace.new(namespace, :redis => redis)
      when Redis::Namespace
        @redis = server
      else
        @redis = Redis::Namespace.new(:timeline, :redis => server)
      end
    end

    def redis
      return @redis if @redis
      self.redis = Redis.respond_to?(:connect) ? Redis.connect : "localhost:6379"
      self.redis
    end


    def push_noty(followers,event_id)
      if followers.is_a? Array
        followers.each do |u|
          item = {:id => event_id,:read => false}.to_json
          add_activity_by_user(u.id,item)
        end
      else
          add_activity_by_user(followers.id,{:id => event_id,:read => false }.to_json)
      end

    end
    protected

    def add_activity_by_user(user_id, activity_item)
      redis_add "user:id:#{user_id}:posts", activity_item
    end

    def redis_add(list, activity_item)
      TimelineNotify.redis.lpush list, activity_item
    end
  end
  module Actor
    def timeline
      @events = TimelineNotify.redis.lrange "user:id:#{self.id}:posts",0,20
      @events.map do |e|
        TimelineEvent.new(JSON.parse(e))
      end
    end
    def clear_timeline
      TimelineNotify.redis.del "user:id:#{self.id}:posts"
    end
    def unread_timeline
      timeline.select do |t|
        t.read == false
      end
    end
   end

  

      
end
