class Users::InvitationsController < Devise::InvitationsController
  
  protected
  
     def invite_resource(&block)
       @user = User.find_by_email(invite_params[:email])
        # @user is an instance or nil
       if @user && @user.email != current_user.email
        # invite! instance method returns a Mail::Message instance
         @user.invite!(current_user)
          # return the user instance to match expected return type
         @user
       else
         # invite! class method returns invitable var, which is a User instance
         resource_class.invite!(invite_params, current_inviter, &block)
       end
     end
      def after_sign_in_path_for(resource)
         reset_session
      end

end
