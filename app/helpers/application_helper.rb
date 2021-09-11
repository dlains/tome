module ApplicationHelper
  def title(title)
    content_for :title, title.to_s
  end

  def description(text)
    content_for :description, text.to_s
  end

  def format_date(date, format = :stamp)
    date.blank? ? '--' : date.to_s(format)
  end
end
