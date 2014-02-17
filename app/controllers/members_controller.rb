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
    @appointments = Appointment.find_by_sql ["
    SELECT 
      appointment.id as appointmentID,
      appointment.date,
      pet.name as petName,
      appointment.reminder,
      appointment.reason,
      user.id as userID,
      user.name as userName
    FROM 
      appointments appointment 
    INNER JOIN 
      pets pet 
    ON 
      appointment.pet_id = pet.id 
    INNER JOIN
      users user
    ON
      user.id = appointment.user_id
    WHERE 
      appointment.user_id = ?", params['id']
    ]
    @pets = Pet.where(:user_id => params['id'])
  end
end
