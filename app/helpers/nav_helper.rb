module NavHelper
  def active_class(path)
    current_page?(path) ? 'active' : ''
  end
end
