# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :custom_welcome, only: [:create]

  private

  def custom_welcome
    flash[:notice] = t('.hello', name: current_user.first_name)
  end
end
