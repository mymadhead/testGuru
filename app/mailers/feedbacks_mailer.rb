class FeedbacksMailer < ApplicationMailer
  include ActionView::Helpers::TextHelper
  def send_feedback(params)
    @email = params[:email]
    @feedback = params[:feedback]

    mail to: 'mymadhead@yandex.ru', subject: truncate(@feedback, length: 15, escape: false)
  end
end