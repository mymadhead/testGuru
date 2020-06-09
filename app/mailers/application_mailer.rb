# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru <guru@testguru.com")
  layout 'mailer'
end
