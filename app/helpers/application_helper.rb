# frozen_string_literal: true

module ApplicationHelper
  BADGES_URLS = %w[
    https://cdn3.iconfinder.com/data/icons/flat-badges-vol1/100/44_-512.png
    https://cdn3.iconfinder.com/data/icons/flat-badges-vol1/100/67_-512.png
    https://cdn3.iconfinder.com/data/icons/flat-badges-vol1/100/66_-512.png
    https://cdn3.iconfinder.com/data/icons/flat-badges-vol1/100/64_-512.png
    https://cdn1.iconfinder.com/data/icons/scenarium-vol-9/128/034_award_achievement_reward_badge-256.png
    https://cdn2.iconfinder.com/data/icons/unilite-shift-human-vol-3/60/011_117_strenght_arm_power_biceps-512.png
    https://cdn2.iconfinder.com/data/icons/unilite-shift-human-vol-1/60/011_048_avatar_man_student_bachelor-512.png https://cdn2.iconfinder.com/data/icons/unilite-shift-achievements-badges/60/028_022_badge_award_peace_dove-512.png
    https://cdn1.iconfinder.com/data/icons/unilite-shift-emoji/60/040_029_party_face_happy_emoji-512.png
  ].freeze

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
