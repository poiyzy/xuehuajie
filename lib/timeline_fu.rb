module TimelineFu
  module Fires
    def self.included(klass)
      klass.send(:extend, ClassMethods)
    end

    module ClassMethods
      def fires(event_type, opts)
        raise ArgumentError, "Argument :on is mandatory" unless opts.has_key?(:on)

        # Array provided, set multiple callbacks
        if opts[:on].kind_of?(Array)
          opts[:on].each { |on| fires(event_type, opts.merge({:on => on})) }
          return
        end
        
        opts[:subject] = :self unless opts.has_key?(:subject)

        method_name = :"fire_#{event_type}_after_#{opts[:on]}"
        define_method(method_name) do
          create_options = [:actor, :subject, :secondary_subject,:follower].inject({}) do |memo, sym|
            if opts[sym]
              if opts[sym].respond_to?(:call)
                memo[sym] = opts[sym].call(self)
              elsif opts[sym] == :self
                memo[sym] = self
              else
                memo[sym] = send(opts[sym])
              end
            end
            memo
          end
          create_options[:event_type] = event_type.to_s
          @followers = create_options.delete(:follower)
          @note =  Notification.create!(create_options)
          case event_type.to_s
           when "follow"
             TimelineNotify.push_noty(@followers,@note.id)
           when "system_notify"
             TimelineNotify.push_note(User.all,@note.id)
           when "comment"
             TimelineNotify.push_note(@followers,@note.id)
          end

        end

        send(:"after_#{opts[:on]}", method_name, :if => opts[:if])
       
      end
    end
  end
end
