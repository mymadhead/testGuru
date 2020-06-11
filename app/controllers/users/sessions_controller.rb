class Users::SessionsController < Devise::SessionsController
  after_action :message_after_login, only: :create

  private

  def message_after_login
    flash[:notice] = I18n.t('success', user: current_user.first_name)
  end
end
