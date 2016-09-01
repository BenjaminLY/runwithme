module EventsHelper
  def event_css_class_name(filter_name)
    return "active" if filter_name == @filter
  end
end
