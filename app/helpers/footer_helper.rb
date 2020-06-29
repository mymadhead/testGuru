# frozen_string_literal: true

module FooterHelper
  def year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank', class: "text-dark"
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "#{type} alert" if flash[type]
  end
end
