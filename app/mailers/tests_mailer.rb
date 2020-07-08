# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test


    mail to: @user.email, subject: 'Test Guru test completed!'
  end
end