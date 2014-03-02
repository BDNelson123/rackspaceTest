class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user].permit(:name, :years, :address, :city, :state, :zip, :school, :years, :type, :code, :email, :password, :password_confirmation)
    end
end
