module BootstrapHelper
  # Navigation
  def active_link_to(name, link, params={})
    content_tag :li, class: active?(link) do
      link_to name, link, class: params[:class]
    end
  end

  def active?(link)
    current_page?(link) ? 'active' : ''
  end
end
