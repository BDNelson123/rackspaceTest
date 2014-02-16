class RegistrationsController < Devise::RegistrationsController
  def create
    @code = Code.select('code').where(:type => params['user']['type']).first
    @user = User.new(params['user'])

    if params['user']['code'].to_i == @code[:code].to_i
      @user.save
      redirect_to after_sign_in_path_for(resource)
    else
      flash[:alert] = 'Your code to register was incorrect.'
      render :action => "new"
    end
  end
end
