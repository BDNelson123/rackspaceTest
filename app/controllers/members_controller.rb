class MembersController < ApplicationController
  before_filter :authenticate_user!

  def index
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

  def show
    @user = User.where(:id => params['id']).first
    @appointments = Appointment.joins(:user, :pet).select("
      appointments.id as appointmentID,
      appointments.date,
      pets.name as petName,
      appointments.reminder,
      appointments.reason,
      users.id as userID,
      users.name as userName
    ").where("appointments.user_id" => params['id'])
    @pets = Pet.where(:user_id => params['id'])
  end
end
