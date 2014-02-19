class MembersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params['type'] == nil || params['type'] == "Customer"
      @users = User.where(:type => "Customer")
    else
      @users = User.where(:type => params['type'])
    end
  end

  def show
    @user = User.where(:id => params['id']).first
    @appointments = Appointment.joins(:user, :pet).select("
      appointments.id,
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
