# frozen_string_literal: true

module ApplicationHelper

  def alert_class(key)
    case key
    when 'alert'
      'alert-danger'
    when 'notice'
      'alert-primary'
    else
      'alert-secondary'
    end
  end
end
