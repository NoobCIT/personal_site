module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success
        "alert-success"
      when :error
        "alert-error"
      else
        flash_type.to_s
    end
  end

  def markdown(text)
    options = { hard_wrap: true,
                filter_html: true,
                autolink: true,
                no_intra_emphasis: true,
                link_attributes: { rel: 'nofollow', target: '_blank' }
              }
    renderer =  CustomHtml.new(options)

    extensions = { fenced_code_blocks: true }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
