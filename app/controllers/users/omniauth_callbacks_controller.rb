class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.sign_in_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect user

    # if user.save
    #   sign_in_and_redirect user, notice: "Signed in!"
    # else
    #   redirect_to new_user_registration_path
    # end
  end
end
