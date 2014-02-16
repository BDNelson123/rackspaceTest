class MembersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.type == "Owner"
      @users = User.where("type = ? or type = ?", "Veterinarian", "Owner")
    elsif current_user.type == "Veterinarian"
      @users = User.where("type = ? or type = ?", "Veterinarian", "Owner")
    elsif current_user.type == "Receptionist"
      @users = User.where(:type => "Customer")
    else
      redirect_to(:controller => 'appointments', :action => 'show', :id => current_user.id)
    end
  end
end
