class ConfirmationsController < Devise::ConfirmationsController
  def show
    byebug
  end
  private

  def after_confirmation_path_for(resource_name, resource)
    return '/#/login'
  end

end
