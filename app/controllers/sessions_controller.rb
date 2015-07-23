class SessionsController < Devise::SessionsController

  def create
    logger.ap params[:user]
    params[:user].merge!(remember_me: 1)
    super
  end

end
