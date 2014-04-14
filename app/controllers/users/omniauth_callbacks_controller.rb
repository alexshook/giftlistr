class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
  #   user = User.sign_in_omniauth(request.env["omniauth.auth"])
  #   sign_in_and_redirect user

  #   # if user.save
  #   #   sign_in_and_redirect user, notice: "Signed in!"
  #   # else
  #   #   redirect_to new_user_registration_path
  #   # end
  # end

# this method is from the documentation for devise, do i need to whitelist params?
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.sign_in_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
