class Users::RegistrationsController < Devise::RegistrationsController
  def edit
  end

  def update
    if resource.update user_params
      redirect_to @user
    else
      flash[:notice] = "Sorry, try that again."
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :email, :password, :encrypted_password)
  end
end
