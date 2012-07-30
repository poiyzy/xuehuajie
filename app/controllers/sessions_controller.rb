class SessionsController < Devise::SessionsController
   before_filter :authentication_user

   private

   def authentication_user
     if current_user
       if current_user.set_profile?
         redirect_to home_path
       else
         redirect_to getting_start
       end
     end
   end
end
