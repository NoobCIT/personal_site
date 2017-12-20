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

  def markdown(content)
    options = { hard_wrap: true, filter_html: true, autolink: true, no_intra_emphasis: true, fenced_code_blocks: true }
    @markdown ||=  Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    @markdown.render(content)
  end
end
