class Users::RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!, except: [:index]

  def update
    #FIXME :avatar is throwing the sorry, something went wrong notice. Password can be updated without a problem. Bucket name is correct. Image url throws 404 in console and s3 bucket has no file or images.
    if @user.update user_params
      flash[:notice] = "Your profile has been updated! "
      redirect_to @user
    else
      flash[:notice] = "Sorry, something went wrong. Try that again."
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :email, :password, :encrypted_password)
  end
end
