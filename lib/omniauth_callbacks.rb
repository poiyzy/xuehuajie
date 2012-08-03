#coding: utf-8
module OmniauthCallbacks

  def self.included(base)
    base.extend         ClassMethods

    base.send :include, InstanceMethods
  end 

  module ClassMethods
    def find_for_douban(response)
      uid = response["uid"]
      data = response["info"]
      if user = User.where("authorizations.provider" => provider,"authorizations.uid" => uid,:include => "authorizations").first
           user
      else
        return false
      end
    end

    def fetch_douban_data(provider,uid,data,current_user)
      user_name = data.name
      bio = data.description
      image_url_small = data.image
      location = data.location
      @profile = Profile.find_or_initialize_by_user_id(current_user.id) 
      @profile.update_attributes(:user_name => user_name,:bio => bio,:image_url_small => image_url_small)

      
    end
    def new_from_provider_data(provider, uid, data)
      
      
      User.new do |user|
        user.email = data["email"]
        user.email = "twitter+#{uid}@example.com" if provider == "twitter"
        user.email = "douban+#{uid}@example.com" if provider == "douban"

        user.login = data["nickname"]
        user.login = data["name"] if provider == "google"
        user.login.gsub!(/[^\w]/, "_")

        if User.where(:login => user.login).count > 0 || user.login.blank?
          user.login = "u#{Time.now.to_i}" # TODO: possibly duplicated user login here. What should we do?
        end

        user.password = Devise.friendly_token[0, 20]
        user.location = data["location"]
        user.tagline = data["description"]
      end
    end

  end


  module InstanceMethods
 
    def bind?(provider)
      self.authorizations.collect { |a| a.provider }.include?(provider)
    end
    
    def bind_service(response,user)
      Rails.logger.warn(response.inspect)
      provider = response["provider"]
      uid = response["uid"]
      if find_bindding(provider,uid)
        authorizations.where(:provider => provider).first.update_attributes(:provider => provider,:uid => uid)
        return "Exist"
      else
        authorizations.create(:provider => provider , :uid => uid ) 
        if provider == "douban"
          User.fetch_douban_data(provider,uid,response['info'],user)
        end
        return "Create"
      end
    end

    def find_bindding(provider,uid)
      authorizations.where(:provider => provider,:uid => uid).first
    end

  end 
end




#module OmniauthCallbacks
    ##  ["github","google","twitter"].each do |provider|
      ##define_method "find_or_create_for_#{provider}" do |response|
        ##uid = response["uid"]
        ##data = response["info"]

        ##if user = User.where("authorizations.provider" => provider , "authorizations.uid" => uid).first
          ##user
        ##elsif user = User.find_by_email(data["email"])
          ##user.bind_service(response)
          ##user
        ##else
          ##user = User.new_from_provider_data(provider, uid, data)

          ##if user.save(:validate => false)
            ##user.authorizations << Authorization.new(:provider => provider, :uid => uid )
            ##return user
          ##else
            ##Rails.logger.warn("User.create_from_hash 失败，#{user.errors.inspect}")
            ##return nil
##          end
        ##end
      ##end
    ##end

      #end
