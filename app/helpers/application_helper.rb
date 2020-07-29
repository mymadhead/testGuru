# frozen_string_literal: true

module ApplicationHelper
  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class: "#{type} alert"
    end
  end

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
