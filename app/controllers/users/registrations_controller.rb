class Users::RegistrationsController < Devise::RegistrationsController
  def edit
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
