require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module PostsHelper
  def markdown_full(post)
    renderer(post).render(post.content).html_safe
  end

  def markdown_summary(post)
    renderer(post).render(post.summary).html_safe
  end

  private

  class PoeHTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    include Rails.application.routes.url_helpers

    # def initialize(options, images)
    #   super(options)
    #   @images = images
    # end

    # def image(link, title, alt_text)
    #   image = @images.find { |elem| elem.blob['filename'].include?(link) }
    #   link = rails_blob_path(image, disposition: 'attachment', only_path: true) unless image.nil?
    #   "<img class='img-fluid' src='#{link}' title='#{title}' alt='#{alt_text}'/>"
    # end
  end

  def renderer(post)
    Redcarpet::Markdown.new(formatter(post), extensions)
  end

  def formatter(post)
    PoeHTML.new(options)
  end

  def options
    {
      filter_html:         false,
      hard_wrap:           true,
      link_attributes:     { rel: 'nofollow', target: '_blank'},
      space_after_headers: true
    }
  end

  def extensions
    {
      autolink:            true,
      superscript:         true,
      fenced_code_blocks:  true
    }
  end
end
