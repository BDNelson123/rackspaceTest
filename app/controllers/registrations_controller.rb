class RegistrationsController < Devise::RegistrationsController
  # for some reason my validations for years and school are working but not redirecting back to sign up with error message
  def years_and_schools
    if params['user']['type'] == 'Veterinarian' || params['user']['type'] == 'Owner'
      if params['user']['school'] == nil || params['user']['years'] == nil
        flash[:alert] = 'Your code to register was incorrect.'
        render :action => "new"
      end
    end
  end

  def create
    super
  end
end
