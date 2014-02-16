class MembersController < ApplicationController
  before_filter :authenticate_user!

  def index
    self.custom_cancan_signin

    if params['type'] == nil || params['type'] == "Customer"
      @users = User.where(:type => "Customer")
    elsif params['type'] == "Receptionist"
      @users = User.where(:type => "Receptionist")
    elsif params['type'] == "Veterinarian"
      @users = User.where(:type => "Veterinarian")
    elsif params['type'] == "Owner"
      @users = User.where(:type => "Owner")
    end
  end
end
