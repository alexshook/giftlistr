class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    # @user = User.find params[:id]
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
